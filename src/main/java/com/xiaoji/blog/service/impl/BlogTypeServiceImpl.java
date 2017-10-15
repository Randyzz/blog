package com.xiaoji.blog.service.impl;

import com.sun.tracing.dtrace.Attributes;
import com.xiaoji.blog.dao.BlogTypeDao;
import com.xiaoji.blog.entity.BlogType;
import com.xiaoji.blog.entity.PageBean;
import com.xiaoji.blog.service.BlogTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BlogTypeServiceImpl implements BlogTypeService {
    @Autowired
    private BlogTypeDao blogTypeDao;
    public PageBean<BlogType> listByPage(PageBean<BlogType> pageBean) {
        pageBean.setResut(blogTypeDao.listByPage(pageBean.getStart(),pageBean.getEnd()));
        pageBean.setTotal(blogTypeDao.getTotal());
        return pageBean;
    }

    public Integer addBlogType(BlogType blogType) {
        return blogTypeDao.addBlogType(blogType);
    }

    public Integer delBlogType(Integer id) {
        return blogTypeDao.delBlogType(id);
    }

    public Integer updateBlogType(BlogType blogType) {
        return blogTypeDao.updateBlogType(blogType);
    }
}
