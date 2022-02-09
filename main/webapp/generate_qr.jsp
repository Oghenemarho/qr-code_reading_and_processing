<%-- 
    Document   : generate_qr
    Created on : Jun 21, 2021, 9:59:43 AM
    Author     : user2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <%
    String success = request.getParameter("success");
    String error = request.getParameter("error");
    String certificateNumber = "";
    String qrSource = "";
    
    if(success != null && success.equals("1")){
        qrSource = "/CertificateQrScanner/images/qr_code.png";
        certificateNumber = request.getParameter("certificate_number");
        qrSource += "?" + certificateNumber;
    }
    else if(success != null && success.equals("0")){
    
//        out.println("<script>alert('failed')</script>");
        out.println("<script>alert('" + error +"')</script>");
    }
    else{
    
    }
    %>
<!--        CREATE DATABASE CertDb;
CREATE TABLE Certificates(id INT IDENTITY PRIMARY KEY, certificate_number CHAR(8) NOT NULL UNIQUE, issued_to VARCHAR(70) NOT NULL, 
certificate_type VARCHAR(MAX) NOT NULL)
INSERT INTO Certificates (certificate_number, issued_to, certificate_type) VALUES 
('00000001', 'John Doe', 'Certificate in Advanced Java Programming'), 
('00000002', 'Eric Mann', 'Certificate in Advanced C# Programming'),
('00000003', 'Jane Doe', 'Certificate in Python Programming')-->
        <h2>Generate QR Code</h2>
        <form method="post" action="/CertificateQrScanner/generateQr">
            <label for="certificate_number">Certificate Number</label>
            <input type="text" name="certificate_number" id="certificate_number" value="<%= certificateNumber %>"></input>
            <input type="text" name="submitted" value="true" hidden readonly>
            <button>Generate</button>  
        </form>
        
        <img src="<%= qrSource %>"> 
    </body>
</html>
