/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import com.marhii.dao.CertificateDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user2
 */
@WebServlet("/verifyCertificateNumber")
public class VerifyCertificateNumber extends HttpServlet{
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{
        String certificateNumber = request.getParameter("certificate_number");
        
        PrintWriter out = response.getWriter();
        
        int rowCount = CertificateDao.verifyCertificateNum(certificateNumber);
        if(rowCount != 0){
            out.println("<script>alert('The certificate is valid'); window.location = 'qr_scan.jsp'</script>");
        }
        else if(rowCount == 0){
            out.println("<script>alert('The certificate is invalid'); window.location = 'qr_scan.jsp'</script>");
        }
    }
}
