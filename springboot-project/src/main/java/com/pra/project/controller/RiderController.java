package com.pra.project.controller;

import com.pra.project.pojo.User;
import com.pra.project.service.DeliveryService;
import com.pra.project.service.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Administrator
 */
@RestController
public class RiderController {

    @Autowired
    DeliveryService deliveryService;

    /*修改店铺管理人员状态*/
    @GetMapping("/changeRiderStat")
    public String changeRiderStat(String stat,String did){
        System.out.println("ChangeRiderStat:::");
        System.out.println("stat:"+stat+"\n"+"did:"+did);
        boolean flag =deliveryService.changeRiderStat(stat, did);
        if(flag){
            return "success";
        }
        return "fail";
    }

}
