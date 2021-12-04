<%-- 
    Document   : tambah
    Created on : Dec 3, 2021, 7:09:12 AM
    Author     : user
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>TAMBAH DATA!</h1>
        <form action="" method="POST">
            <label>nama</label><input type="text" name="nama"/><br/>
            <label>kelas</label><input type="text" name="kelas"/><br/>
            <label>jurusan</label><input type="text" name="jurusan"/><br/>
            <label>tgl</label><input type="text" name="tgl"/><br/>
            <label>dibayar</label><input type="text" name="dibayar"/><br/>
            <input type="submit" name="submit" value="simpan"/><br/>
            <a href="index.jsp">kembali</a>
            
        </form>
    </body>
</html>



 <%@page import ="java.sql.*" %>
 <%@page import ="javax.swing.*" %>
<%
    String id_nim=null;
    String nama=request.getParameter("nama");
    String kelas=request.getParameter("kelas");
    String jurusan=request.getParameter("jurusan");
    String tgl=request.getParameter("tgl");
    String dibayar=request.getParameter("dibayar");
    String URL="jdbc:mysql://localhost:3306/crud";
    //koneksi database
   
    Connection conn=null;
    PreparedStatement ps=null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    int updateQuery=0;
    
    if(nama!=null && kelas!=null && jurusan!=null && tgl!=null && dibayar!=null) {
        try{
            conn=DriverManager.getConnection(URL,"root","");
            String query="INSERT INTO kas (id_nim,nama,kelas,jurusan,tgl,dibayar)VALUES (?,?,?,?,?,?)";
            ps=conn.prepareStatement(query);
            ps.setString(1, id_nim);
            ps.setString(2, nama);
            ps.setString(3, kelas);
            ps.setString(4, jurusan);
            ps.setString(5, tgl);
            ps.setString(6, dibayar);
            updateQuery=ps.executeUpdate();
            if(updateQuery!=0){
                JOptionPane.showMessageDialog(null, "berhasil tambah data");
                response.sendRedirect("index.jsp");
                
            }
        }catch (Exception e){
            out.println("koneksi berhasil"+e.getMessage());
        }finally{
            ps.close();
            conn.close();
            
        }
         
    }
%>