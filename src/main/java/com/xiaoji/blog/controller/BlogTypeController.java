package com.xiaoji.blog.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xiaoji.blog.entity.BlogType;
import com.xiaoji.blog.entity.PageBean;
import com.xiaoji.blog.service.BlogTypeService;
import com.xiaoji.blog.util.ResponseUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping(value = "/admin/blogType")
public class BlogTypeController {
    @Autowired
    private BlogTypeService blogTypeService;

    @RequestMapping(value = "/list")
    public String listBlogType(
            @RequestParam(value = "page",required = false) String page,
            @RequestParam(value = "rows",required = false) String rows,
            HttpServletResponse response
    ) throws Exception {
        System.out.println(page);
        System.out.println(rows);
        PageBean<BlogType> pageBean=new PageBean<BlogType>(Integer.parseInt(page),Integer.parseInt(rows));
        pageBean=blogTypeService.listByPage(pageBean);
        //创建JSONObject
        JSONObject result = new JSONObject();
        //序列化list为 jsonArray
        String jsonArray=JSON.toJSONString(pageBean.getResut());
        System.out.print(jsonArray);
        JSONArray array=JSONArray.parseArray(jsonArray);
        result.put("rows",array);
        result.put("total",pageBean.getTotal());

        ResponseUtil.write(response,result);
        return null;
    }
}
