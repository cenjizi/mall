package com.kzh.service.impl;

import com.kzh.dao.IndexImgMapper;
import com.kzh.entity.IndexImg;
import com.kzh.service.IndexImgService;
import com.kzh.vo.ResStatus;
import com.kzh.vo.ResultVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class IndexImgServiceImpl implements IndexImgService {
    @Autowired
    private IndexImgMapper indexImgMapper;

    private Logger logger = LoggerFactory.getLogger(IndexImgServiceImpl.class);

    @Override
    public ResultVO listIndexImgs() {
        List<IndexImg> imgList = indexImgMapper.listIndexImgs();
        if(imgList.size() == 0) {
            logger.info("无轮播图");
            return new ResultVO(ResStatus.NO,"无轮播图",null);
        }else {
            logger.info("轮播图查询成功");
            return new ResultVO(ResStatus.OK, "轮播图查询成功", imgList);
        }
    }
}
