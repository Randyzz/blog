<%--
  Created by IntelliJ IDEA.
  User: Gzzzzzh
  Date: 2017/10/14
  Time: 18:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="easyui-dialog" style="width:500px;height:300px" id="dlg"
     data-options="title:'添加博客类别',modal:true,closed:true" buttons="#dlg-buttons">
    <form id="form" method="post">
        <div style="padding:30px 80px">
            <table cellpadding="5">
                <tr>
                    <td><label for="typeName">博客类别名称(*)</label></td>
                    <td><input class="easyui-textbox" placeholder="博客类别名称"
                               id="typeName" name="typeName" type="text" data-options="required:true"></td>
                </tr>
                <tr>
                    <td><label for="orderNum">博客类别排序(*)</label></td>
                    <td><input class="easyui-textbox" placeholder="请输入博客类别排序"
                               id="orderNum" name="orderNum" type="text" data-options="required:true"></td>
                </tr>
            </table>
        </div>
    </form>
</div>
<div id="dlg-buttons">
    <div>
        <a href="#" onclick="saveBlogType()" class="easyui-linkbutton" iconCls="icon-ok" plain="true">保存</a>
        <a href="javascript:close()" class="easyui-linkbutton" iconCls="icon-cancel" plain="true">关闭</a>
    </div>
</div>
<script>
    var url;
    function close() {
        $("#typeName").val(""); //保存成功后将内容置空
        $("#typeNum").val("");
        $('#dlg').dialog('close');
    }
    function saveBlogType() {
        $("#form").form("submit",{
            url:url,
            success:function (result) {
                console.log(result);
                var results = eval("("+result+")");
                if(results.success){
                    $.messager.alert("系统提示", "博客类别保存成功");
                    $("#typeName").val(""); //保存成功后将内容置空
                    $("#typeNum").val("");
                    $("#dlg").dialog("close"); //关闭对话框
                    $("#dg").datagrid("reload"); //刷新一下
                }else{
                    $.messager.alert("系统提示", "博客类别保存失败");
                }
            }
        })
    }
</script>
</body>
</html>
