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

    /**
     * 添加博客类型
     * @param blogType
     * @return
     */
    Integer addBlogType(BlogType blogType);

    /**
     * 删除博客类型
     * @param id
     * @return
     */
    Integer delBlogType(Integer id);

    /**
     * 修改博客类型
     * @param blogType
     * @return
     */
    Integer updateBlogType(BlogType blogType);
}
