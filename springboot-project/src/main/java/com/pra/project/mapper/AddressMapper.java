package com.pra.project.mapper;

import com.pra.project.VO.AddressVO;
import com.pra.project.pojo.Address;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author Administrator
 */
@Repository
public interface AddressMapper {

    /*根据用户id查询所有address*/
    List<Address> listAllAddress(Integer id);

    /*根据用户id修改address*/
    Integer updateAddressById(Address address);

    /*添加address*/
    Integer addAddress(AddressVO address);

    /*根据aid获取address*/
    Address findAddressByAid(Integer aid);

    void deleteAddressById(Integer id);
}


