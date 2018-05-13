<%--
  Created by IntelliJ IDEA.
  User: 26522
  Date: 2017/8/3
  Time: 21:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" import="com.liu.vo.*,com.liu.service.*" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    String action=request.getParameter("action");
    UserServiceImpl service=new UserServiceImpl();
    if(action.equals("add")){
        String username=request.getParameter("username");
        String password=request.getParameter("password");

        User user=new User();
        user.setUsername(username);
        user.setPassword(password);
        if(service.register(user)){
%>
<jsp:forward page="index.jsp"/>
<%
    }
}else if(action.equals("del")){
    int id=Integer.parseInt(request.getParameter("id"));
    if(service.del(id)){

%>
<jsp:forward page="index.jsp"/>
<%
    }

}else if(action.equals("queryid")){//修改取，用户信息
    int id=Integer.parseInt(request.getParameter("id"));
    User user=service.queryId(id);
    request.setAttribute("user",user);

%>
<jsp:forward page="index.jsp"/>
<%
}else if(action.equals("edit")){

    String username=request.getParameter("username");
    String password=request.getParameter("password");
    int id=Integer.parseInt(request.getParameter("id"));
    User user=new User();
    user.setUsername(username);
    user.setPassword(password);
    user.setId(id);
    if(service.edit(user)){
        request.removeAttribute("user");
%>
<jsp:forward page="index.jsp"/>
<%
        }
    }

%>