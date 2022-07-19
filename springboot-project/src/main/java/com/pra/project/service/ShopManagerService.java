package com.pra.project.service;

import com.pra.project.VO.ShopManagerRegisterVO;
import com.pra.project.pojo.ShopManager;

import java.util.HashMap;

public interface ShopManagerService {
    /*根据商家用户名查询是否存在*/
    ShopManager findShopManagerByUsername(String username);

    /*根据商家身份证号查询是否存在*/
    ShopManager findShopManagerByIdentityNumber(String identityNumbr);

    /*根据手机号查询是否存在*/
    ShopManager findShopManagerByPhone(String phone);

    /*店铺管理人员注册和店铺注册*/
    boolean shopManagerRegisterInfo(ShopManagerRegisterVO shopManagerRegisterVO);

    /*分页查询所有店铺管理人员*/
    HashMap<String,Object> findAllShopManagerByPage(String currentPage, Integer valueOf);

    boolean changeShopManageStat(String stat, String sid);
}
