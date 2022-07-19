package com.pra.project.VO;

import com.pra.project.pojo.Address;
import com.pra.project.pojo.Order;
import com.pra.project.pojo.Shop;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Administrator
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderFreeVO {
    private String userName;
    private String userPhone;
    private Order order;
    private Shop shop;
    private Address address;
}
