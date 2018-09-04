<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">

    $(function () {
        var toolbar = [{
            iconCls: 'icon-edit',
            text: "专辑详情",
            handler: function () {
                var row = $("#tt").treegrid("getSelected");
                if (row != null) {
                    if (row.author != null) {
                        $("#album_dd").dialog("open")
                        $('#album_ff').form('load', row);
                        $('#img').prop('src', "${pageContext.request.contextPath}/upload/" + row.img);
                    } else {
                        alert("请选中专辑");
                    }
                } else {
                    alert("请选中行");
                }


            }
        }, '-', {
            text: "添加章节",
            iconCls: 'icon-help',
            handler: function () {

            }
        }, '-', {
            text: "添加专辑",
            iconCls: 'icon-help',
            handler: function () {

            }
        }, '-', {
            text: "下载音频",
            iconCls: 'icon-help',
            handler: function () {
                var row = $("#tt").treegrid("getSelected");
                if (row != null) {
                    if (row.author == null) {
                        location.href = "${pageContext.request.contextPath}/chapter/down?url=" + row.url + "&name=" + row.name
                    } else {
                        alert("请选中专辑");
                    }
                } else {
                    alert("请选中行");
                }

            }
        }]

        $('#tt').treegrid({
            onDblClickRow: function (row) {
                $("#audio_dd").dialog("open")
                $("#audio").prop("src", "${pageContext.request.contextPath}/upload/" + row.url)
            },
            url: '${pageContext.request.contextPath}/json/treedatagrid2.json',
            method: "get",
            idField: 'id',
            treeField: 'name',
            columns: [[
                {field: 'name', title: '名称', width: 60},
                {field: 'size', title: '大小', width: 60},
                {field: 'url', title: '路径', width: 80},
                {field: 'time', title: '时长', width: 80}
            ]],
            fit: true,
            fitColumns: true,
            toolbar: toolbar,
        });
    })
</script>

<table id="tt"></table>
<div id="album_dd" class="easyui-dialog" title="My Dialog" style="width:400px;height:200px;"
     data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
    <form id="album_ff" method="post">
        <div>
            <label for="name">title:</label>
            <input class="easyui-validatebox" type="text" id="name" name="name" data-options=""/>
        </div>
        <div>
            <label for="count">count:</label>
            <input class="easyui-validatebox" type="text" id="count" name="count" data-options=""/>
        </div>
        <div>
            <label for="brief">brief:</label>
            <input class="easyui-validatebox" type="text" id="brief" name="count" data-options=""/>
        </div>
        <div>
            <img src="" id="img" alt="">
        </div>
    </form>

    <div id="audio_dd" class="easyui-dialog" title="My Dialog" style="width:400px;height:200px;"
         data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
        <audio src="" id="audio" controls="controls" autoplay="autoplay">

        </audio>
    </div>


</div>

