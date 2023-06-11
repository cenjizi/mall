package com.kzh.dao;

import com.kzh.entity.UserAddr;
import com.kzh.general.GeneralDAO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserAddrMapper extends GeneralDAO<UserAddr> {
    public int updateAddrById(@Param("userAddr") UserAddr userAddr);

}