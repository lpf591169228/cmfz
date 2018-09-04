<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
    $(function () {

        var toolbar = [{
            iconCls: 'icon-edit',
            text: "添加",
            handler: function () {
                $("#dd").dialog("open");
            }
        }, '-', {
            text: "删除",
            iconCls: 'icon-help',
            handler: function () {
                /*
                 * 删除数据
                 *
                 * */
            }
        }, '-', {
            text: "修改",
            iconCls: 'icon-help',
            handler: function () {
                /*
                 *使当前选中行可编辑模式
                 * */
                var row = $("#dg").edatagrid("getSelected");
                if (row != null) {

                    var index = $("#dg").edatagrid("getRowIndex", row)
                    //当前行可编辑
                    $("#dg").edatagrid("editRow", index)

                } else {
                    alert("请先选中行")
                }


            }
        }, '-', {
            text: "保存",
            iconCls: 'icon-help',
            handler: function () {
                $("#dg").edatagrid("saveRow")
            }
        }]

        $('#dg').edatagrid({
            url: '${pageContext.request.contextPath}/json/banner.json',
            method: "get",
            updateUrl: "${pageContext.request.contextPath}/cmfz/banner/add",
            columns: [[

                {field: 'id', title: '编号', width: 100},
                {field: 'title', title: '名称', width: 100},
                {
                    field: 'status', title: '状态', width: 100, editor: {
                    type: "text",
                    options: {
                        required: true
                    }
                }
                },
                {field: 'desc', title: '描述', width: 100},
                {field: 'createDate', title: '时间', width: 100}

            ]],
            fitColumns: true,
            fit: true,
            pagination: true,
            pageSize: 5,
            pageList: [5, 10, 15, 20],
            toolbar: toolbar,
            view: detailview,
            detailFormatter: function (rowIndex, rowData) {
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}' + rowData.imgPath + '" style="height:50px;"></td>' +
                    '<td style="border:0">' +
                    '<p>Attribute: ' + rowData.createDate + '</p>' +
                    '<p>Status: ' + rowData.status + '</p>' +
                    '</td>' +
                    '</tr></table>';
            }

        });
    })
    function submit() {
        $("#ff").form("submit", {
            url: "${pageContext.request.contextPath}/banner/add"
        })
    }
</script>

<table id="dg"></table>
<div id="dd" class="easyui-dialog" title="My Dialog" style="width:400px;height:200px;"
     data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true,buttons:[{
				text:'保存',
				handler:function(){
                     submit();
                      $('#dd').dialog('close');
                      $('#dg').edatagrid('reload')
				}
			},{
				text:'关闭',
				handler:function(){
                     $('#dd').dialog('close');
				}
			}]">
    <form id="ff" method="post" enctype="multipart/form-data">
        <div>
            <label for="title">title:</label>
            <input class="easyui-validatebox" id="title" type="text" name="title" data-options="required:true"/>
        </div>
        <div>
            <label for="description">description:</label>
            <input class="easyui-textbox" type="text" id="description" name="description" data-options=""/>
        </div>
        <div>
            <select id="cc" class="easyui-combobox" name="status" style="width:200px;">
                <option value="Y">展示</option>
                <option value="N">不展示</option>
            </select>
        </div>
        <div>
            <input class="easyui-filebox" name="img" style="width:300px">
        </div>

    </form>


</div>


