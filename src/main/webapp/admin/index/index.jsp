<%--
  Created by IntelliJ IDEA.
  User: Gzzzzzh
  Date: 2017/10/13
  Time: 23:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人博客后台系统</title>
    <%--<%@include file="../common/head.jspf"%>--%>
    <link href="../../static/jquery-easyui-1.5.3/themes/icon.css" rel="stylesheet" type="text/css">
    <link href="../../static/jquery-easyui-1.5.3/themes/default/easyui.css" rel="stylesheet" type="text/css">

    <script type="text/javascript" src="../../static/jquery-easyui-1.5.3/jquery.min.js"></script>
    <script type="text/javascript" src="../../static/jquery-easyui-1.5.3/jquery.easyui.min.js"></script>
    <script  type="text/javascript" src="../../static/jquery-easyui-1.5.3/locale/easyui-lang-zh_CN.js"></script>
    <script>
        function addTab(title, url){
            if ($('#tabs').tabs('exists', title)){
                $('#tabs').tabs('select', title);
            } else {
                var content = "<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='/admin/"+url+"'></iframe>";
                $('#tabs').tabs('add',{
                    title:title,
                    content:content,
                    closable:true
                });
            }
        }
    </script>
</head>
<body class="easyui-layout">
    <div data-options="region:'north',border:false" style="height:78px;background:#B3DFDA;">
        <table style="padding: 5px" width="100%">
            <tr>
                <td width="50%">
                    <h2>博客后台系统</h2>
                </td>
                <td valign="bottom" align="right" width="50%">
                    <font size="3">&nbsp;&nbsp;<strong>欢迎：</strong>admin</font>
                </td>
            </tr>
        </table>
    </div>
    <div data-options="region:'west',split:true,title:'West'" style="width:200px">
        <div class="easyui-accordion" data-options="fit:true,border:false">
            <div title="常用操作" data-options="selected:true,iconCls:'icon-item'" style="padding: 10px">
                <a href="#" class="easyui-linkbutton" onclick="addTab('写博客','writeblog.jsp')"
                   data-options="plain:true,iconCls:'icon-writeblog'" style="width: 150px">写博客</a>
                <a href="#" class="easyui-linkbutton" onclick="addTab('评论审核','writeblog.jsp')"
                   data-options="plain:true,iconCls:'icon-review'" style="width: 150px">评论审核</a>
            </div>
            <div title="博客管理" data-options="iconCls:'icon-bkgl'" style="padding:10px;">
                <a href="#" class="easyui-linkbutton" onclick="addTab('写博客','writeblog.jsp')"
                   data-options="plain:true,iconCls:'icon-writeblog'" style="width: 150px;">写博客</a>
                <a href="#" class="easyui-linkbutton" onclick="addTab('博客信息管理','writeblog.jsp')"
                   data-options="plain:true,iconCls:'icon-bkgl'" style="width: 150px;">博客信息管理</a>
            </div>
            <div title="博客类别管理" data-options="iconCls:'icon-bklb'" style="padding:10px">
                <a href="#" class="easyui-linkbutton" onclick="addTab('博客类别信息管理','blogTypeManage.jsp')"
                   data-options="plain:true,iconCls:'icon-bklb'" style="width: 150px;">博客类别信息管理</a>
            </div>
            <div title="评论管理" data-options="iconCls:'icon-plgl'" style="padding:10px">
                <a href="#" class="easyui-linkbutton" onclick="addTab('评论审核','writeblog.jsp')"
                   data-options="plain:true,iconCls:'icon-review'" style="width: 150px">评论审核</a>
                <a href="#" class="easyui-linkbutton" onclick="addTab('评论信息管理','writeblog.jsp')"
                   data-options="plain:true,iconCls:'icon-plgl'" style="width: 150px;">评论信息管理</a>
            </div>
            <div title="个人信息管理" data-options="iconCls:'icon-grxx'" style="padding:10px">
                <a href="#" class="easyui-linkbutton" onclick="addTab('修改个人信息','writeblog.jsp')"
                   data-options="plain:true,iconCls:'icon-grxxxg'" style="width: 150px;">修改个人信息</a>
            </div>
            <div title="系统管理" data-options="iconCls:'icon-system'" style="padding:10px">
                <a href="#" class="easyui-linkbutton" onclick="addTab('友情链接管理','writeblog.jsp')"
                   data-options="plain:true,iconCls:'icon-link'" style="width: 150px">友情链接管理</a>
                <a href="#" class="easyui-linkbutton" onclick="addTab('修改密码','writeblog.jsp')"
                   data-options="plain:true,iconCls:'icon-modifyPassword'" style="width: 150px;">修改密码</a>
                <a href="#" class="easyui-linkbutton" onclick="addTab('刷新系统缓存','writeblog.jsp')"
                   data-options="plain:true,iconCls:'icon-refresh'" style="width: 150px;">刷新系统缓存</a>
                <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-exit'"
                   onclick="addTab('安全退出','writeblog.jsp')"
                   style="width: 150px;">安全退出</a>
            </div>
        </div>
    </div>
    <div data-options="region:'east',split:true,collapsed:true,title:'East'" style="width:100px;padding:10px;">east region</div>
    <div data-options="region:'south',border:false" style="height:40px;background:#A9FACD;padding:5px;">
        <div region="south" style="height: 40px;padding: 5px" align="center">
        Copyright © 2017 小鸡的SSM博客系统 版权所有
        </div>
    </div>
    <div data-options="region:'center',title:'Center'">
        <div class="easyui-tabs" fit="true" border="false" id="tabs">
            <div title="首页" data-options="iconCls:'icon-home'">
                <div align="center" style="padding-top: 100px"><font color="red" size="10">欢迎使用</font></div>
            </div>
        </div>
    </div>
</body>
</html>
