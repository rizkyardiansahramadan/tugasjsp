<%-- 
    Document   : proses
    Created on : Dec 4, 2021, 1:20:37 AM
    Author     : user
--%>

<%@page import ="java.sql.*" %>

<%
String id_nim=request.getParameter("id_nim");
String nama=request.getParameter("nama");
String kelas=request.getParameter("kelas");
String jurusan=request.getParameter("jurusana");
String tgl=request.getParameter("tgl");
String dibayar=request.getParameter("dibayar");

if(id_nim!=null) {
    Connection conn=null;
    PreparedStatement ps=null;
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/crud","root","");
        String query="update kas set id_nim=?, nama=?, kelas=?, jurusan=?, tgl=?, dibayar=? where id_nim="+id_nim+"";
        ps=conn.prepareStatement(query);
        ps.setString(1, id_nim);
        ps.setString(2, nama);
        ps.setString(3, kelas);
        ps.setString(4, jurusan);
        ps.setString(5, tgl);
        ps.setString(6, dibayar);
        int i= ps.executeUpdate();  
        
            response.sendRedirect("index.jsp");
        } catch (Exception e) {
            response.sendRedirect("index.jsp");
        }
}


%>