/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user2
 */
@WebServlet("/generateQr")
public class GenerateQr extends HttpServlet{
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
        String certificateNumber = request.getParameter("certificate_number");
        String error = "";        

        String pathString = "C:\\Users\\user2\\Documents\\NetBeansProjects\\CertificateQrScanner\\src\\main\\webapp\\images\\qr_code.png";
        Path path = Paths.get(pathString);
        String success = "0";
        try {
            if(Files.exists(path)){
                Files.delete(path);
            }
            BitMatrix matrix = new MultiFormatWriter().encode(certificateNumber, BarcodeFormat.QR_CODE, 300, 300);
            MatrixToImageWriter.writeToPath(matrix, "png", path);
            success = "1";
        } catch (Exception ex) {
            error = ex.getMessage();
        }
        
        response.sendRedirect("generate_qr.jsp?success=" + success + "&error=" + error + "&certificate_number=" + certificateNumber);
    }
}
