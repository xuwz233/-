package com.pra.project.VO;

import com.pra.project.pojo.Shop;
import com.pra.project.pojo.ShopManager;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Administrator
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ShopManagerRegisterVO {
    public ShopManager userInfo;
    public Shop shopInfo;
}
