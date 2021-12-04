<%-- 
    Document   : delete
    Created on : Dec 3, 2021, 8:06:27 AM
    Author     : user
--%>

<%@page import ="java.sql.*"%>
<%
  String id_nim=request.getParameter("id");
  try{
      Class.forName("com.mysql.jdbc.Driver");
      Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/crud","root","");
      Statement st=conn.createStatement();
      int i=st.executeUpdate("DELETE FROM kas WHERE id_nim="+id_nim+"");
      response.sendRedirect("index.jsp");
  }catch(Exception e){
      response.sendRedirect("index.jsp");
      
  }
%>
