package com.pra.project.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.pra.project.pojo.Delivery;
import com.pra.project.response.Result;
import com.pra.project.service.DeliveryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Administrator
 */
@RestController
public class DeliveryController {

    @Autowired
    DeliveryService deliveryService;

    String loginCode;

    /*根据oid获取taker*/
    @GetMapping("/findTakerByOid")
    public String findTakerByOid(String oid){
        System.out.println(oid);
        Delivery deliveryMan = deliveryService.findTakerByOid(Integer.valueOf(oid));
        return JSON.toJSONString(deliveryMan);
    }

    /*检查phone是否已注册*/
    @GetMapping("/checkPhone")
    public String checkPhone(String phone){
        Delivery delivery = deliveryService.findDeliveryByPhone(phone);
        if(delivery!=null){
            return "exist";
        }else {
            return "none";
        }
    }

    /*发送code*/
    @GetMapping("/sendCode")
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

    /*骑手验证码登录*/
    @GetMapping("/riderCodeLogin")
    public String riderCodeLogin(String phone,String code){
        String newCode = phone+"_"+code;
        System.out.println("newCode:"+newCode);
        /*String loginCode = (String) session.getAttribute("loginCode");
        System.out.println("loginCode:"+loginCode);*/
        if(newCode.equals(loginCode)){
            Delivery delivery = deliveryService.findDeliveryByPhone(phone);
            System.out.println("delivery的stat："+ delivery.getStat());
            System.out.println(delivery.getStat()==1);
            if(delivery.getStat()==1){
                //登陆成功
                System.out.println("登陆成功！");
                Map<String,Object> map=new HashMap<>();
                map.put("delivery",delivery);
                return"success";
            }
            else{
                System.out.println("登录失败");
                return "fail2";
            }
        }else {
            return "fail";
        }
    }

    /*根据did获取delivery*/
    @GetMapping("/findDeliveryByDid")
    public String findDeliveryByDid(String did){
        Delivery delivery = deliveryService.findDeliveryByDid(Integer.valueOf(did));
        return JSON.toJSONString(delivery, SerializerFeature.WriteMapNullValue);
    }


}
