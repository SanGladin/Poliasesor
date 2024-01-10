/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Administrador
 */
public class Conexion {
        public static Connection getConnection(){
        String url, userName, password;
        
        url = "jdbc:sqlserver://poliasesor.database.windows.net:1433;database=Poliasesor;user=PoliAs@poliasesor;password=Jose2015;loginTimeout=30;";
        
        Connection con = null;
        
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            
            con = DriverManager.getConnection(url);
            
            System.out.println("Conexion Exitosa con la BD");
        
        }catch(Exception e){
            System.out.println("Error al conectar la BD");
            System.out.println(e.getMessage());
            System.out.println(e);
        
        }
        return con;
    }
    
}


