package com.xiaoji.blog.test;

import com.xiaoji.blog.dao.BlogTypeDao;
import com.xiaoji.blog.dao.BloggerDao;
import com.xiaoji.blog.entity.BlogType;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-beans.xml")
public class BlogTypeTest {
    @Autowired
    private BlogTypeDao blogTypeDao;

    @Test
    public void addBlogType(){
        BlogType blogType = new BlogType("MySQL",10);
        int val=blogTypeDao.addBlogType(blogType);
        System.out.print(val);
    }
    @Test
    public void delBlogType(){
        int val=blogTypeDao.delBlogType(1);
        System.out.print(val);
    }
    @Test
    public void updateBlogType(){
        BlogType blogType=blogTypeDao.getById(2);
        blogType.setTypeName("MySQL22");
        int val=blogTypeDao.updateBlogType(blogType);
        System.out.print(val);
    }
    @Test
    public void getById(){
        BlogType blogType=blogTypeDao.getById(5);
        System.out.print(blogType);
    }
    @Test
    public void listByPage(){
        Integer page =1; //第一页
        Integer pageSize = 2; //一页显示2条
        Integer start = (page-1)*pageSize;
        Integer end = page*pageSize;
        List<BlogType> list=blogTypeDao.listByPage(start,end);
        for (BlogType blogType :
                list) {
            System.out.print(blogType);
        }
    }
    @Test
    public void testGetTotal(){
        Long size = blogTypeDao.getTotal();
        System.out.print(size);
    }
}
