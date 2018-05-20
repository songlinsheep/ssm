<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'index.jsp' starting page</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <script type="text/javascript" src="static/js/jquery1.4.2.min.js"></script>
</head>

<body>
<form action="/ssm-test/loginTest" method="POST">
    <input type="text" name="useraccount" />
    <br/>
    <input type="password" name="password" />
    <br/>
    <!-- 使用ajax时不要写成submit，否则会两次提交 -->
    <%--<input type="button" name="sub" id="sub" />--%>
    <input type="submit" value="提交"/>
</form>
<br/>
登录后获取的数据：<p id="result"></p>
</body>


<script>
    $.post(
        "/ssm-test/loginTest",
        {useraccount:"admin",password:"admin"},
        function(data,state){
            //这里显示返回的状态
            alert(state);
            //这里显示从服务器返回的数据
            alert(data.username);

            // json对象----- >>字符串
            // JSON.stringify(obj)
            // json字符串------>>json对象
            // JSON.parse(string)
            //设置内容
            $("#result").text(JSON.stringify(data));
        },
        "json"//type为请求的数据类型，可以是html,xml,json等类型
    );
</script>


</html>
