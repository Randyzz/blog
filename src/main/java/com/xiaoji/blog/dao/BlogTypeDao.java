package com.xiaoji.blog.dao;

import com.xiaoji.blog.entity.BlogType;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 博客类别 Dao
 *
 */
@Repository
public interface BlogTypeDao {
    /**
     * 新增类型
     * @param blogType
     * @return
     */
    Integer addBlogType(BlogType blogType);

    /**
     * 删除类型
     * @param id
     * @return
     */
    Integer delBlogType(Integer id);

    /**
     * 修改类型
     * @param blogType
     * @return
     */
    Integer updateBlogType(BlogType blogType);

    /**
     * 根据id获取类型
     * @param id
     * @return
     */
    BlogType getById(Integer id);

    /**
     * 分页查询博客类别
     * @param start
     * @param end
     * @return
     */
    List<BlogType> listByPage(@Param("start") Integer start, @Param("end") Integer end);

    /**
     * 查询总记录数
     * @return
     */
    Long getTotal();
}

