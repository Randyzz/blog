package com.xiaoji.blog.service;

import com.xiaoji.blog.entity.BlogType;
import com.xiaoji.blog.entity.PageBean;

public interface BlogTypeService {
    /**
     * 分页查询
     * @param pageBean
     * @return
     */
    PageBean<BlogType> listByPage(PageBean<BlogType> pageBean);

}
