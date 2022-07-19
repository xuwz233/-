package com.pra.project.service.impl;

import com.pra.project.VO.AddressVO;
import com.pra.project.mapper.AddressMapper;
import com.pra.project.pojo.Address;
import com.pra.project.service.AddressService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Administrator
 */
@Service
public class AddressServiceImpl implements AddressService {

    @Resource
    AddressMapper addressMapper;

    /*根据用户id查询所有address*/
    @Override
    public List<Address> listAllAddress(Integer id) {
        return addressMapper.listAllAddress(id);
    }

    /*根据用户id修改address*/
    @Override
    public boolean updateAddressById(Address address) {
        int row = addressMapper.updateAddressById(address);
        if(row>0){
            return true;
        }
        return false;
    }

    /*添加address*/
    @Override
    public boolean addAddress(AddressVO address) {
        int row = addressMapper.addAddress(address);
        if(row>0){
            return true;
        }
        return false;

    }

    @Override
    public boolean deleteAddressById(Integer id) {
        addressMapper.deleteAddressById(id);
        return true;
    }
}
