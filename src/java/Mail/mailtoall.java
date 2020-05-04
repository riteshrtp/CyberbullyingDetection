package Mail;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage; 
  
public class mailtoall {
String d_email = null,
//String d_email = "from@...",
d_password = null,
//d_password = "***",
d_host = "smtp.gmail.com",
d_port = "465",
//m_to = "to@...",
m_to = null;
         String d_user="",
m_subject = "Social network Request",
m_text = ""; 
public mailtoall(String usermail,String userpass,String msg1) {
        try {
            d_email = "malnad088";
            d_password = "malnadcollege";
           
           
        d_user =usermail;
        Properties props = new Properties();
        props.put("mail.smtp.user", d_email);
        props.put("mail.smtp.host", d_host);
        props.put("mail.smtp.port", d_port);
        props.put("mail.smtp.starttls.enable","true");
        props.put("mail.smtp.auth", "true");
        //props.put("mail.smtp.debug", "true");
        props.put("mail.smtp.socketFactory.port", d_port);
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.socketFactory.fallback", "false"); 
        SecurityManager security = System.getSecurityManager(); 

         Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork1", "root", "root");
                    Statement st = con.createStatement();
                    ResultSet res = st.executeQuery("select * from reg where userid!='"+usermail+"' ");
                  while (res.next()) {
                       // m_to = res.getString("user");
                        System.out.println(" here#################" + res.getString("userid"));
                        
        try {
        Authenticator auth = new mailtoall.SMTPAuthenticator();
        Session session = Session.getInstance(props, auth);
        //session.setDebug(true); 
        MimeMessage msg = new MimeMessage(session);
        msg.setText(msg1);
        msg.setSubject(m_subject);
        System.out.println("D_Mail-==="+d_email);
        msg.setFrom(new InternetAddress(d_email));
        msg.addRecipient(Message.RecipientType.TO, new
        InternetAddress(res.getString("userid")));
        Transport.send(msg);
           } catch (Exception mex) {
        mex.printStackTrace();
        }
        
        }
        } catch (SQLException ex) {
            Logger.getLogger(mailtoall.class.getName()).log(Level.SEVERE, null, ex);
        }
        catch (ClassNotFoundException ex) {
            Logger.getLogger(mailtoall.class.getName()).log(Level.SEVERE, null, ex);
       
        }
}
private class SMTPAuthenticator extends javax.mail.Authenticator {
public PasswordAuthentication getPasswordAuthentication() {
    System.out.println("Mail Id:"+d_email+"Password:"+d_password);
return new PasswordAuthentication(d_email, d_password);
}
} 
public static void main(String[] args){
mailtoall sendmail=new mailtoall("rtpCyberDemo@gmail.com","rtp","Sending Request");
}
} 