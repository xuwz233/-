package com.pra.project.controller;

import com.alibaba.fastjson.JSON;
import com.pra.project.pojo.Address;
import com.pra.project.VO.AddressVO;
import com.pra.project.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author Administrator
 */
@RestController
public class AddressController {

    @Autowired
    private AddressService addressService;

    /*根据用户id查询所有address*/
    @GetMapping("/listAddress")
    public String listAddress(String uid){
        //System.out.println(uid);
        Integer id = Integer.valueOf(uid);
        List<Address> addressesList = addressService.listAllAddress(id);
        //System.out.println(addressesList);
        return JSON.toJSONString(addressesList);
    }

    /*根据用户id修改address*/
    @PutMapping("/updateAddressById")
    public String updateAddressById(@RequestBody Address address){
        boolean flag = addressService.updateAddressById(address);
        if(flag){
            return "success";
        }
        return "fail";
    }

    /*添加address*/
    @PostMapping("/addAddress")
    public String addAddress(@RequestBody AddressVO addressInfo){
        System.out.println(addressInfo);
        boolean flag = addressService.addAddress(addressInfo);
        if(flag){
            return "success";
        }
        return "fail";
    }

    @PutMapping("/deleteAddressById")
    public String deleteAddressById(@RequestBody Address address){
        int id=address.getAId();
        System.out.println(id);
        boolean flag=addressService.deleteAddressById(id);
        if(flag){
            return "success";
        }
        return "fail";
    }
}
