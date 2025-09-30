/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author alexhiginio05
 */
public class Estudiante {
    Conexion cn;
    private int id;
    private String carne,nombres,apellidos,direccion,correo,telefono,fecha_nacimiento;

    public Estudiante() {
    }

    public Estudiante(int id, String carne, String nombres, String apellidos, String direccion, String correo, String telefono, String fecha_nacimiento) {
        this.id = id;
        this.carne = carne;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.direccion = direccion;
        this.correo = correo;
        this.telefono = telefono;
        this.fecha_nacimiento = fecha_nacimiento;
    }

  

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCarne() {
        return carne;
    }

    public void setCarne(String carne) {
        this.carne = carne;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(String fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }
    
      public HashMap dro_sangre(){
    HashMap<String,String> drop =  new HashMap();
    
    try{
      cn = new Conexion();
      String query = "SELECT id_tipo_sangre as id,sangre FROM tipos_sangre;";
      cn.abrir_conexion();
      ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
      while(consulta.next()){
      drop.put(consulta.getString("id") ,consulta.getString("tipos_sangre"));
      
      }
      cn.cerrar_conexion();
    
    }catch(SQLException ex){
    
    System.out.println( ex.getMessage());
    }
    return drop;
    }
    
    
       public DefaultTableModel leer(){
    
       DefaultTableModel tabla = new DefaultTableModel();
       
       try{
       cn = new Conexion();
       cn.abrir_conexion();
       String query = "SELECT e.id_estudiante as id,e.carne, e.nombres, e.apellidos, e.direccion, e.telefono, e.correo_electronico, e.fecha_nacimiento, e.id_tipo_sangre,s.sangre FROM estudiantes as e inner join tipos_sangre as s on e.id_tipo_sangre = s.id_tipo_sangre;";
       ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
        String encabezado []= {"Carné","Nombres","apellidos","direccion","telefon","Correo","fn","id_tipo_sangre","Sangre"};
        
        tabla.setColumnIdentifiers(encabezado);
        String datos[]= new String[9];
        while (consulta.next()){
        datos [0] = consulta.getString("id");
        datos [1] = consulta.getString("carne");
        datos [2] = consulta.getString("nombres");
        datos [3] = consulta.getString("apellidos");
        datos [4] = consulta.getString("direccion");
        datos [5] = consulta.getString("telefono");
        datos [6] = consulta.getString("correo_electronico");
        datos [7] = consulta.getString("fecha_nacimiento");
       
        datos [8] = consulta.getString("sangre");
      
        
     
          tabla.addRow(datos);
        }
        
       cn.cerrar_conexion();
       }catch(SQLException ex){
       System.out.println(ex.getMessage());
       }
       return tabla;
   }
    
      public int agregar(){
       
       int retorno = 0;
   try{
       PreparedStatement parametro;
       cn = new Conexion();
       String query ="INSERT INTO estudiantes(carne,nombres,apellidos,direccion,telefono,correo_electronico,fecha_nacimiento,id_tipo_sangre) VALUES(?,?,?,?,?,?,?,?);";
       cn.abrir_conexion();
       parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
      parametro.setString(1,this.getCarne());
      parametro.setString(2,this.getNombres());
      parametro.setString(3,this.getApellidos());
      parametro.setString(4,this.getDireccion());
      parametro.setString(5,this.getTelefono());
      parametro.setString(6,this.getCorreo());
      parametro.setString(7,this.getFecha_nacimiento());
       parametro.setInt(7,this.getId());
      retorno=parametro.executeUpdate();
       
       cn.cerrar_conexion();
   }catch(SQLException ex){
   System.out.println(ex.getMessage());
   
  retorno= 0;
   }
   return retorno;
   } 
}
