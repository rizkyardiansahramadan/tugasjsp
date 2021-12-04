<%-- 
    Document   : index
    Created on : Dec 3, 2021, 5:59:13 AM
    Author     : user
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>form login</title>
    </head>
    <body>
        <%-- Mulai Script Koneksi --%>
        <%@page import ="java.sql.*" %>
        
        <% Connection connection=null;
        Statement statement=null;
        ResultSet rs=null;
        try{
            String connectionURL="jdbc:mysql://localhost:3306/crud";
            String username="root";
            String password="";
            Class.forName("com.mysql.jdbc.Driver");
            connection=DriverManager.getConnection(connectionURL,username,password);
            
            statement = connection.createStatement();
            String query="SELECT * FROM kas";
            rs=statement.executeQuery(query);
        %>
         <a href="tambah.jsp">tambah data</a>
        <table border="1">
            <tr>
                <th>id_nim</th>
                <th>nama</th>
                <th>kelas</th>
                <th>jurusan</th>
                <th>tgl</th>
                <th>dibayar</th>
                <th>aksi</th>
                <th class="text-center">Action</th>
            </tr>
            <% while (rs.next()){ %>
            <tr>
               <td><%out.println(rs.getInt("id_nim"));%></td>
               <td><%out.println(rs.getString("nama"));%></td>
               <td><%out.println(rs.getString("kelas"));%></td>
               <td><%out.println(rs.getString("jurusan"));%></td>
               <td><%out.println(rs.getString("tgl"));%></td>
               <td><%out.println(rs.getString("dibayar"));%></td>
               <td><a href="edit.jsp?id=<%out.println(rs.getInt("id_nim"));%>">edit</a>  |  <a href="delete.jsp?id=<%out.println(rs.getInt("id_nim"));%>">Delete</a></td>
            </tr>
            <% } %>
        </table>
        <%
            rs.close();
            statement.close();
            connection.close();
        }catch(Exception e){
            System.err.println("gagal koneksi"+e.getMessage());
            out.println("gagal"+e.getMessage());
        }
        %>
        
        
        <%-- Mulai Script Koneksi --%>
    </body>
</html>
