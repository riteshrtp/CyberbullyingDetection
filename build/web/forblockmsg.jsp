<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%String name = null;
                 //    System.out.println("Word OK"+session.getAttribute(""));
                     Connection cons = databaseconnection.databasecon.getconnection();
                     Statement sts = cons.createStatement();
                     Statement sts1 = cons.createStatement();
                     
                     ResultSet rr = sts1.executeQuery("select * from reg where userid = '"+(String)session.getAttribute("userid")+"'");
                     if(rr.next()){
                         name = rr.getString("fname");
                     }
                     int c=sts.executeUpdate("insert into buser values('"+name+"','"+(String)session.getAttribute("ll").toString()+"')");
                     
                     int ii = sts.executeUpdate("insert into new_m values('"+name+"','"+(String)session.getAttribute("ll").toString()+"')");
                    if(ii!=0){
                       response.sendRedirect("status.jsp?status updated..!");
                     }
                     else{
                         out.println("Error");
                     }
                     %>