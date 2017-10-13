package com.xiaoji.blog.dao;

import com.xiaoji.blog.entity.Blogger;
import org.springframework.stereotype.Repository;

/**
 * 博主接口
 */
@Repository
public interface BloggerDao {

    Blogger getBloggerDao();
}
