package com.pra.project.service.impl;

import com.pra.project.mapper.UserMapper;
import com.pra.project.pojo.User;
import com.pra.project.service.UserService;
import com.pra.project.utils.PageTool;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

/**
 * @author Administrator
 */
@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;


    /*根据用户名获取信息*/
    @Override
    public User findUserByUsername(String username) {
        return userMapper.findUserByUsername(username);
    }

    /*根据用户名获取店家信息*/
    @Override
    public User findShopManagerByUsername(String username) {
        return userMapper.findShopManagerByUsername(username);
    }

    /*根据用户名获取管理员信息*/
    @Override
    public User findManagerByUsername(String username) {
        return userMapper.findManagerByUsername(username);
    }

    /*分页获取所有用户*/
    @Override
    public HashMap<String,Object> findAllUserByPage(String currentPage, Integer pageSize) {
        //1、获取用户总数count
        Integer count = userMapper.getUserCount();
        PageTool pageTool = new PageTool(count, currentPage, pageSize);
        //分页获取用户
        List<User> users = userMapper.findAllUserByPage(pageTool.getStartIndex(), pageTool.getPageSize());
        //System.out.println("users:"+users);
        HashMap<String, Object> hashMap = new HashMap<>();
        hashMap.put("users",users);
        hashMap.put("count",count);
        return hashMap;
    }

    /*根据用户手机号查找用户是否存在*/
    @Override
    public User findUserByPhone(String phone) {
        return userMapper.findUserByPhone(phone);
    }

    /*用户注册*/
    @Override
    public boolean userRegister(User user) {
        Integer row = userMapper.userRegister(user);
        if(row>0){
            return true;
        }
        return false;
    }

    /*根据id获取用户*/
    @Override
    public User findUserByUid(String id) {
        return userMapper.findUserByUid(Integer.valueOf(id));
    }

    /*修改用户信息*/
    @Override
    public boolean updateUserMessage(User user) {
        Integer row = userMapper.updateUserMessage(user);
        if(row>0){
            return true;
        }
        return false;
    }

    @Override
    public boolean changeUserStat(String stat, String id) {
        userMapper.changeUserStat(stat, id);
//        if(row>0){
//            return true;
//        }
//        return false;
        return true;
    }

    @Override
    public boolean updateAllUserMessage(User user) {
        userMapper.updateAllUserMessage(user);
//        if(row>0){
//            return true;
//        }
//        return false;
        return true;
    }
}
