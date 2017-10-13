package com.xiaoji.blog.test;

import com.xiaoji.blog.dao.BloggerDao;
import com.xiaoji.blog.entity.Blogger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-beans.xml")
public class BloggerDaoTest {
    @Autowired
    private BloggerDao bloggerDao;

    @Test
    public void getBloggerData(){
       Blogger blogger= bloggerDao.getBloggerDao();
       System.out.print(blogger);
    }
}
