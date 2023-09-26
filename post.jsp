<%@page import="Mysql.DbConnection"%>
<%@page import="graph.algo.PublicPosts"%>
<%@page import="Mysql.Twitter"%>
<%    
    String Key1 = (String) session.getAttribute("sapp_key");
    String Key2 = (String) session.getAttribute("sapp_secret");
    String Key3 = (String) session.getAttribute("sacc_key");
    String Key4 = (String) session.getAttribute("sacc_token");
    String msg = (String) session.getAttribute("message");
    
    System.out.println("Key1 : " + Key1);
    System.out.println("Key2 : " + Key2);
    System.out.println("Key3 : " + Key3);
    System.out.println("Key4 : " + Key4);
    System.out.println("Message : " + msg);
    PublicPosts tw = new PublicPosts();
    tw.setData(Key1, Key2, Key3, Key4, msg);
    response.sendRedirect("twe.jsp");
    
    
%>