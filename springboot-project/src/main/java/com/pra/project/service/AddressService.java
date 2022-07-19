package com.pra.project.service;

import com.pra.project.pojo.Address;
import com.pra.project.VO.AddressVO;

import java.util.List;

public interface AddressService {
    /*根据用户id查询所有address*/
    List<Address> listAllAddress(Integer id);

    /*根据用户id修改address*/
    boolean updateAddressById(Address address);

    /*添加address*/
    boolean addAddress(AddressVO address);

    boolean deleteAddressById(Integer id);
}
