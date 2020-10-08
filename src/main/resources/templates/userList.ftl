<!DOCTYPE html>

<html lang="en">

<head>

<meta  charset=UTF-8">

<title>用户列表页面FreeMarker</title>


<script type="text/javascript" src="jquery-3.2.1.js"></script>

</head>

<body>

    <input type="button" value="添加用户界面" onclick="showAddUserWindow()" />

    <input type="button" value="编辑用户界面" onclick="showEditUserWindow()" />

    <hr />

    <form>

        <table border="1">

            <thead>

                <tr>

                    <th>选择</th>

                    <th>ID</th>

                    <th>用户名</th>

                    <th>性别</th>

                    <th>生日</th>

                    <th>操作</th>

                </tr>

            </thead>

            <tbody id="userList"></tbody>

        </table>

    </form>

    <hr />

    <div id="addUserDiv" style="display: none">

        <form id="addUserForm">

            <table>

                <caption>添加用户界面</caption>

                <tr>

                    <td>用户名</td>

                    <td><input type="text" name="user_name" value="zhang"></td>

                </tr>

                <tr>

                    <td>性别</td>

                    <td><input type="text" name="sex" value="男"></td>

                </tr>

                <tr>

                    <td>生日</td>

                    <td><input type="date" name="birthday"></td>

                </tr>

                <tr>

                    <td colspan="2"><input type="button" value="添加用户" id="addUser"></td>

                </tr>

            </table>

        </form>

    </div>

    <div id="editUserDiv" style="display: none">

        <form id="editUserForm">

            <table>

                <caption>编辑用户界面</caption>

                <tr>

                    <td>ID</td>

                    <td><input type="text" name="uid" id="uid" readonly

                        style="background: lightgray"></td>

                </tr>

                <tr>

                    <td>用户名</td>

                    <td><input type="text" name="user_name" id="user_name"></td>

                </tr>

                <tr>

                    <td>性别</td>

                    <td><input type="text" name="sex" id="sex"></td>

                </tr>

                <tr>

                    <td>生日</td>

                    <td><input type="date" name="birthday" id="birthday"></td>

                </tr>

                <tr>

                    <td colspan="2"><input type="button" value="更新用户" id="editUser"></td>

                </tr>

            </table>

        </form>

    </div>



    <script>

        $(function() {

            getUserList();

        });

        function getUserList() {

            $("#userList").empty();

            $.ajax({

                        url : "/news",

                        type : "GET",

                        dataType : "json",

                        success : function(data) {
                            $.each(data,function(index, user) {

                                                var userRow = $("<tr></tr>");

                                                var selectCell = $("<td><input type='checkbox' value='"+user.uid+"'/></td>")

                                                var idCell = $("<td></td>")
                                                        .append(user.uid);

                                                var user_nameCell = $(

                                                        "<td></td>").append(

                                                        user.user_name);

                                                var userPwdCell = $("<td></td>")

                                                        .append(user.sex);

                                                var ageCell = $("<td></td>")

                                                        .append(user.birthday);

                                                var editButton = $(

                                                        "<input type='button' value='编辑' class='editClass'/>")

                                                        .attr("edit-id",

                                                                user.uid);

                                                var deleteButton = $(

                                                        "<input type='button' value='删除' class='deleteClass'/>")

                                                        .attr("edit-id",

                                                                user.uid);

                                                var opCell = $("<td></td>")

                                                        .append(editButton)

                                                        .append(deleteButton);

                                                userRow.append(selectCell)

                                                        .append(idCell).append(

                                                                user_nameCell)

                                                        .append(userPwdCell)

                                                        .append(ageCell)

                                                        .append(opCell);

                                                $("#userList").append(userRow);



                                            });



                        }

                    });

        }

        $(document).on("click", ".deleteClass", function() {

            var userId = $(this).attr("edit-id");

            $.ajax({

                url : "/news/" + userId,

                type : "DELETE",

                dataType : "json",

                success : function(data) {

                    alert(data.msg);

                    getUserList();

                }

            });

        });

        $(document).on(

                "click",

                ".editClass",

                function() {

                    var uid = $(this).attr("edit-id");

                    //取消所有的复选框

                    $(this).parents("table").find("input[type=checkbox]").prop(

                            "checked", false);

                    //选中当前行的复选框

                    $(this).parents("tr").find("input").prop("checked", true);

                    $.ajax({

                        url : "/news/" + uid,

                        type : "GET",

                        dataType : "json",

                        success : function(data) {

                            $("#addUserDiv").css("display", "none");

                            $("#editUserDiv").css("display", "block");



                            $("#uid").val(data.user.uid);

                            $("#user_name").val(data.user.user_name);

                            $("#sex").val(data.user.sex);

                            $("#birthday").val(data.user.birthday);

                        }

                    });

                });

        $("#addUser").click(function() {

            $.ajax({

                url : "/news/",

                type : "POST",

                data : $("#addUserForm").serialize(),//此处不是JSON数据，在Controller中不能使用@RequestBody进行转换

                success : function(data) {

                    alert(data.msg);

                    getUserList();

                }

            });

        });

        $("#editUser").click(function() {

            $.ajax({

                url : "/news/",

                type : "PUT",

                data : $("#editUserForm").serialize(),

                success : function(data) {

                    alert(data.msg);

                    getUserList();

                }

            });

        });



        function showAddUserWindow() {

            if ($("#addUserDiv").css("display") == "none") {

                $("#addUserDiv").css("display", "block");

            } else {

                $("#addUserDiv").css("display", "none");

            }

            $("#editUserDiv").css("display", "none");

        }

        function showEditUserWindow() {

            if ($("#editUserDiv").css("display") == "none") {

                $("#editUserDiv").css("display", "block");

            } else {

                $("#editUserDiv").css("display", "none");

            }

            $("#addUserDiv").css("display", "none");

        }

    </script>

</body>

</html>