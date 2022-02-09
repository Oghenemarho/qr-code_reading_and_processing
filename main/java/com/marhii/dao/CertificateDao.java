/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marhii.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author user2
 */
public class CertificateDao {
    public static String errorMessage;
    public static Connection getConnection(){
        Connection connection = null;
        try{
            String url = "jdbc:sqlserver://desktop-mie3511\\localhost:1434;databaseName=CertDb";
            String username = "sa";
            String password = "akporhuarho11";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
            
        }catch(ClassNotFoundException | SQLException ex){
            errorMessage = ex.getMessage();
        }
        return connection;        
    }
    
    public static int verifyCertificateNum(String certificateNumber){
        int rowCount = 0;
        try(
            Connection connection = CertificateDao.getConnection();
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM Certificates WHERE certificate_number = ?");
            ){
            statement.setString(1, certificateNumber);
            ResultSet result = statement.executeQuery();
            if(result.next()){
                rowCount = 1;
            }
        }catch(SQLException ex){
            errorMessage = ex.getMessage();
        }
        return rowCount;
    }
}
