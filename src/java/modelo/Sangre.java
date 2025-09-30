/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

/**
 *
 * @author alexhiginio05
 */
public class Sangre {
    private Conexion cn;
    private String sangre;
    private int id,id_sangre;

    public Sangre() {
    }

    public Sangre(Conexion cn, String sangre, int id, int id_sangre) {
        this.cn = cn;
        this.sangre = sangre;
        this.id = id;
        this.id_sangre = id_sangre;
    }

    public Conexion getCn() {
        return cn;
    }

    public void setCn(Conexion cn) {
        this.cn = cn;
    }

    public String getSangre() {
        return sangre;
    }

    public void setSangre(String sangre) {
        this.sangre = sangre;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_sangre() {
        return id_sangre;
    }

    public void setId_sangre(int id_sangre) {
        this.id_sangre = id_sangre;
    }
    public HashMap leer(){
     HashMap<String,String> drop  = new HashMap(); // llave, valor
     try{
         cn  = new Conexion();
         cn.abrir_conexion();
         String query = "SELECT id_tipo_sangre,sangre FROM tipos_sangre;";
         ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
                
            while(consulta.next()){
                drop.put(consulta.getString("id_tipo_sangre"), consulta.getString("sangre"));
            }
         cn.cerrar_conexion();
     }catch(SQLException ex){
       System.out.println("Error: " + ex.getMessage());
     }
     return drop;
    }    
    
}
