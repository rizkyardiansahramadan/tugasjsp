<%-- 
    Document   : edit
    Created on : Dec 3, 2021, 10:32:07 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>EDIT DATA!</h1>
        
         <%@page import ="java.sql.*" %>
        
        <% 
         
        String id=request.getParameter("id");
        Connection connection=null;
        Statement statement=null;
        ResultSet rs=null;
        PreparedStatement ps=null;
        try{
            String connectionURL= "jdbc:mysql://localhost:3306/crud";
            String username="root";
            String password="";
            Class.forName("com.mysql.jdbc.Driver");
            connection=DriverManager.getConnection(connectionURL,username,password);
            
            statement = connection.createStatement();
            String query="SELECT * FROM kas WHERE id_nim="+id+"";
            rs=statement.executeQuery(query);
              while (rs.next()){ 
        %>
        
        <form action="proses.jsp" method="post" >
            id_nim<input type="text" name="id_nim" disabled="true" value="<%out.println(rs.getInt("id_nim"));%>"><br>
            nama<input type="text" name="nama" value="<%out.println(rs.getString("nama"));%>"><br>
            kelas<input type="text" name="kelas" value="<%out.println(rs.getString("kelas"));%>"><br>
            jurusan<input type="text" name="jurusan" value="<%out.println(rs.getString("jurusan"));%>"><br>
            tgl<input type="text" name="tgl" value="<%out.println(rs.getString("tgl"));%>"><br>
            dibayar<input type="text" name="dibayar" value="<%out.println(rs.getString("dibayar"));%>"><br>
            <input type="submit" value="Update">
            <a href="index.jsp">kembali</a>
        </form>
        <%
            }    
            rs.close();
            statement.close();
            connection.close();
            }catch(Exception e){
            System.err.println("gagal koneksi"+e.getMessage());
            out.println("gagal"+e.getMessage());
        }
        %>
        
        
    </body>
</html>


