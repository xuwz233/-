package com.pra.project.mapper;

import com.pra.project.pojo.OrderGood;

import java.util.List;

public interface OrderGoodMapper {

    /*根据oid获取订单商品等信息*/
    List<OrderGood> findGidByOid(Integer oid);
}
