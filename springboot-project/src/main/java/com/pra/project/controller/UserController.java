package com.pra.project.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.pra.project.VO.ShopManagerRegisterVO;
import com.pra.project.pojo.Delivery;
import com.pra.project.pojo.ShopManager;
import com.pra.project.pojo.User;
import com.pra.project.response.Result;
import com.pra.project.service.DeliveryService;
import com.pra.project.service.ShopManagerService;
import com.pra.project.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Administrator
 */
@RestController
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    ShopManagerService shopManagerService;

    @Autowired
    DeliveryService deliveryService;

    String loginCode;

    /*用户登录*/
    @GetMapping("/login")
    public String login(String username,String password){
        User user = userService.findUserByUsername(username);
        if(user!=null&&user.getPassword().equals(password)) {
            if ("1".equals(user.getStat())) {
                //登陆成功
                Map<String, Object> map = new HashMap<>();
                map.put("user", user);
                return JSON.toJSONString(new Result().setCode(200).setMessage("登陆成功").setData(map),SerializerFeature.WriteMapNullValue);
            } else{
                return JSON.toJSONString(new Result().setCode(401).setMessage("您的账号由于特殊原因处于冻结状态，详情请联系管理员"));
            }
        }else{//账号错误或密码错误
            return JSON.toJSONString(new Result().setCode(401).setMessage("账号或密码错误！！！"));
        }
    }

    /*根据用户名查找用户是否存在*/
    @GetMapping("/findUserByUsername")
    public String findUserByUsername(String username){
        User user = userService.findUserByUsername(username);
        if(user!=null){
            return "exist";
        }else {
            return "none";
        }
    }

    /*根据id获取用户*/
    @GetMapping("/findUserById")
    public String findUserById(String id){
        User user = userService.findUserByUid(id);
        return JSON.toJSONString(user,SerializerFeature.WriteMapNullValue);
    }

    /*根据用户手机号查找用户是否存在*/
    @GetMapping("/findUserByPhone")
    public String findUserByPhone(String phone){
        User user = userService.findUserByPhone(phone);
        if(user!=null){
            return "exist";
        }else {
            return "none";
        }
    }

    /*修改用户信息*/
    @PostMapping("updateUserMessage")
    public String updateUserMessage(@RequestBody User user){
        System.out.println(user);
        boolean flag = userService.updateUserMessage(user);
        if(flag){
            return "success";
        }
        return "fail";
    }

    /*管理员修改用户信息*/
    @PostMapping("updateAllUserMessage")
    public String updateAllUserMessage(@RequestBody User user){
        System.out.println("进入管理员修改用户信息界面了");
        System.out.println(user);
        boolean flag = userService.updateAllUserMessage(user);
        if(flag){
            return "success";
        }
        return "fail";
    }

    /*修改骑手信息*/
    @PostMapping("updateRiderMessage")
    public String updateRiderMessage(@RequestBody Delivery delivery){
        System.out.println("进入updateRiderMessage了!!");
        System.out.println(delivery);
        boolean flag = deliveryService.updateRiderMessage(delivery);
        if(flag){
            return "success";
        }
        return "fail";
    }


    /*发送code*/
    @GetMapping("/sendCodeUser")
    public String sendCode(String phone){
        //int code = SendSms.sendCode(phone);
        int code = 123;
        if (code == 0) {
            return "fail";
        } else {
            loginCode = phone + "_" + code;
            /*System.out.println("存进session的code："+loginCode);
            session.setAttribute("loginCode", loginCode);*/
            return "success";
        }
    }

    /*用户验证码登录*/
    @GetMapping("/loginByPhone")
    public String riderCodeLogin(String phone,String code){
        String newCode = phone+"_"+code;
        System.out.println("newCode:"+newCode);
        /*String loginCode = (String) session.getAttribute("loginCode");
        System.out.println("loginCode:"+loginCode);*/
        if(newCode.equals(loginCode)){
            User user = userService.findUserByPhone(phone);
            if ("1".equals(user.getStat())) {
                //登陆成功
                Map<String, Object> map = new HashMap<>();
                map.put("user", user);
                return JSON.toJSONString(new Result().setCode(200).setMessage("登陆成功").setData(map), SerializerFeature.WriteMapNullValue);
            } else{
                return JSON.toJSONString(new Result().setCode(401).setMessage("您的账号由于特殊原因处于冻结状态，详情请联系管理员"));
            }
        }else {
            return "fail";
        }
    }


    @PostMapping("/userRegister")
    public String userRegister(@RequestBody User user){
        System.out.println("user:"+user);
        System.out.println("用户注册");
        boolean flag = userService.userRegister(user);
        if(flag){
            return "success";
        }
        return "fail";
    }


    @PostMapping("/riderRegister")
    public String riderRegister(@RequestBody Delivery delivery){
        System.out.println("delivery:"+delivery);
        System.out.println("骑手注册");
        boolean flag=deliveryService.deliveryRegister(delivery);
        if(flag){
            return "success";
        }
        return "fail";
    }



    /*店家登录*/
    @GetMapping("/shopManagerLogin")
    public String shopManagerLogin(String username,String password){
        System.out.println(username);
        System.out.println(password);
        ShopManager shopManager = shopManagerService.findShopManagerByUsername(username);
        if(shopManager!=null&&shopManager.getPassword().equals(password)){
            if(shopManager.getStat()==1){
                //登陆成功
                Map<String, Object> map = new HashMap<>();
                map.put("user",shopManager);
                return JSON.toJSONString(new Result().setCode(200).setMessage("登陆成功").setData(map));
            }else {
                return JSON.toJSONString(new Result().setCode(401).setMessage("您的账号由于特殊原因处于冻结状态，详情请联系管理员"));
            }

        }else{//账号错误或密码错误
            return JSON.toJSONString(new Result().setCode(401).setMessage("账号或密码错误！！！"));
        }
    }

    /*管理员登录*/
    @GetMapping("/managerLogin")
    public String managerLogin(String username,String password){
        User user = userService.findManagerByUsername(username);
        if(user!=null&&user.getPassword().equals(password)){
            //登陆成功
            Map<String, Object> map = new HashMap<>();
            map.put("user",user);
            return JSON.toJSONString(new Result().setCode(200).setMessage("登陆成功").setData(map));
        }else{//账号错误或密码错误
            return JSON.toJSONString(new Result().setCode(401).setMessage("账号或密码错误！！！"));
        }
    }


    //商家注册
    /*根据商家用户名查询是否存在*/
    @GetMapping("/findShopManagerByUsername")
    public String findShopManagerByUsername(String username){
        ShopManager shopManager = shopManagerService.findShopManagerByUsername(username);
        if(shopManager!=null){
            return "exist";
        }else {
            return "none";
        }
    }

    /*根据身份证号查询店铺管理员是否存在*/
    @GetMapping("/findShopManagerByIdentityNumber")
    public String findShopManagerByIdentityNumber(String identityNumber){
        ShopManager shopManager = shopManagerService.findShopManagerByIdentityNumber(identityNumber);
        if(shopManager!=null){
            return "exist";
        }else {
            return "none";
        }
    }

    /*根据手机号查询店铺管理员是否存在*/
    @GetMapping("/findShopManagerByPhone")
    public String findShopManagerByPhone(String phone){
        ShopManager shopManager = shopManagerService.findShopManagerByPhone(phone);
        if(shopManager!=null){
            return "exist";
        }else {
            return "none";
        }
    }

    /*店铺管理人员注册和店铺注册*/
    @PostMapping("/shopManagerRegister")
    public String shopManagerRegister(@RequestBody ShopManagerRegisterVO shopManagerRegisterInfo){
        System.out.println("shopManagerRegisterInfo:"+shopManagerRegisterInfo);
        boolean flag = shopManagerService.shopManagerRegisterInfo(shopManagerRegisterInfo);
        if(flag){
            return "success";
        }else {
            return "fail";
        }
    }

    /*修改店铺管理人员状态*/
    @GetMapping("/changeUserStat")
    public String changeUserStat(String stat,String id){
        System.out.println("ChangeUserStat:::");
        System.out.println("stat:"+stat+"\n"+"id:"+id);
        boolean flag =userService.changeUserStat(stat, id);
        if(flag){
            return "success";
        }
        return "fail";
    }


}
