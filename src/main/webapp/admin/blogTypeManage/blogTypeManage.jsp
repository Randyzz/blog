<%--
  Created by IntelliJ IDEA.
  User: Gzzzzzh
  Date: 2017/10/14
  Time: 13:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="../../static/jquery-easyui-1.5.3/themes/icon.css" rel="stylesheet" type="text/css">
    <link href="../../static/jquery-easyui-1.5.3/themes/default/easyui.css" rel="stylesheet" type="text/css">

    <script type="text/javascript" src="../../static/jquery-easyui-1.5.3/jquery.min.js"></script>
    <script type="text/javascript" src="../../static/jquery-easyui-1.5.3/jquery.easyui.min.js"></script>
    <script  type="text/javascript" src="../../static/jquery-easyui-1.5.3/locale/easyui-lang-zh_CN.js"></script>
</head>

<body>
<table id="dg"></table>
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
        <a href="#" onclick="close()" class="easyui-linkbutton" iconCls="icon-cancel" plain="true">关闭</a>
    </div>
</div>
<%--<%@include file="save.jsp"%>--%>
<script>
    var url;
    $(function () {
        //datagrid初始化
        $('#dg').datagrid({
            //请求数据的url
            url: '/admin/blogType/list',
            //载入提示信息
            loadMsg: '加载中...',
            //水平自动展开，如果设置此属性，则不会有水平滚动条，演示冻结列时，该参数不要设置
            fitColumns: true,
            //数据多的时候不换行
            nowrap: true,
            //设置分页
            pagination: true,
            //设置每页显示的记录数，默认是10个
            pageSize: 5,
            //每页显示记录数项目
            pageList: [3, 5, 8, 12],
            //指定id为标识字段，在删除，更新的时候有用，如果配置此字段，在翻页时，换页不会影响选中的项
            idField: 'id',
            //设置行条纹化
            striped:true,
            //上方工具条 添加 修改 删除 刷新按钮
            toolbar:[{
                iconCls: 'icon-add',    //图标
                text: '添加',            //名称
                handler: function () {  //回调函数
//                    alert("添加");
                    $('#dlg').dialog('open');
                    $('#dlg').form('clear');
                    url='/admin/blogType/save';
                }
            },'-',{
                iconCls: 'icon-edit',
                text: '修改',
                handler: function () {
                    var selectedRows=$("#dg").datagrid("getSelections");
                    console.log(selectedRows);
                    if(selectedRows.length!==1){
                        $.messager.alert("系统提示","请选择一个要修改的博客类别");
                        return;
                    }
                    var selected = selectedRows[0];

                    $('#dlg').dialog('open').dialog('setTitle','修改博客类别信息');
                    $('#dlg').form('load',selected);
                    url='/admin/blogType/save?id='+selected.id;
                }
            },'-',{
                iconCls: 'icon-edit',
                text: '删除',
                handler: function () {
                    var selectedRows=$('#dg').datagrid('getSelections');
                    if(selectedRows.length===0){
                        $.messager.alert("系统提示","请选择要删除类别");
                        return;
                    }
                    var arr=[];
                    for(var i=0;i<selectedRows.length;i++){
                        arr.push(selectedRows[i].id);
                    }
                    var ids = arr.join(",");
                    $.messager.confirm("系统提示","<font color=red>您确定要删除选中的"+selectedRows.length+"条数据吗?</font>",function (r) {
                        if(r){
                            $.post('/admin/blogType/del',{ids:ids},function (result) {
                                if(result.exist){
                                    $.messager.alert("系统提示","改类别下有博客，无法删除");
                                }else if(result.success){
                                    $.messager.alert("系统提示","删除成功");
                                }else{
                                    $.messager.alert("系统提示","删除失败");
                                }

                            },"json");
                        }
                        $('#dg').datagrid('clearSelections');
                        $('#dg').datagrid('reload');
                    })

                }
            },'-',{
                iconCls: 'icon-reload',
                text: '刷新',
                handler: function () {
                    $('#dg').datagrid('reload');
                }
            }],
            //同列属性，但是这些列将会冻结在左侧,z大小不会改变，当宽度大于250时，会显示滚动条，但是冻结的列不在滚动条内
            frozenColumns:[[
                {field:'checkbox',checkbox:true},    //复选框
                {field:'id',title:'编号',width:200}    //id字段
            ]],
            columns:[[
                {field:'typeName',title:'分类名称',width:300},   //typeName 字段
                {field:'orderNum',title:'类别排序',width:300},   //orderNum 字段
            ]],
        });


    });
</script>
<script>
    function close() {
        $("#typeName").val(""); //保存成功后将内容置空
        $("#orderNum").val("");
        $('#dlg').dialog('close');
    }
    function saveBlogType() {
        $("#form").form("submit",{
            url:url,
            onSubmit: function() {
                return $(this).form("validate");
            },
            success:function (result) {
                var results = eval("("+result+")");
                if(results.success){
                    $.messager.alert("系统提示", "博客类别保存成功");
                    $('#dlg').form('clear');
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
