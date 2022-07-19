package com.pra.project.VO;

import com.pra.project.pojo.Good;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GoodVO {
    private String categoryName;
    private List<Good> goods;
}
