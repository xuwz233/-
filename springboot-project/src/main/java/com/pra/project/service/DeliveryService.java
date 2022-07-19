package com.pra.project.service;

import com.pra.project.pojo.Delivery;

import java.util.HashMap;

public interface DeliveryService {
    /*根据oid获取taker*/
    Delivery findTakerByOid(Integer oid);

    /*根据phone查询rider*/
    Delivery findDeliveryByPhone(String phone);

    /*分页查询所有骑手*/
    HashMap<String,Object> findAllRidersByPage(String currentPage, Integer valueOf);

    /*根据did获取delivery*/
    Delivery findDeliveryByDid(Integer did);

    boolean deliveryRegister(Delivery delivery);

    boolean changeRiderStat(String stat, String did);
}
