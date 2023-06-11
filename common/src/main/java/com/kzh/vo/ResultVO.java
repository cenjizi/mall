package com.kzh.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResultVO implements Serializable {

    private int code;  //响应给前端的状态码
    private String msg;  //响应给前端的提示信息
    private Object data;  //响应给前端的数据

}
