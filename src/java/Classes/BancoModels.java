/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import Classes.Config;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author renan
 */
public class BancoModels extends Config {

    private Connection conn = null;
    private static final String URL = "jdbc:postgresql://" + ENDERECO + ":" + PORTA + "/" + BASE;

    public boolean conectar() {
        try {
            Class.forName(DRIVER); //seta o driver
            this.conn = DriverManager.getConnection(URL, USUARIO, SENHA); //abre a conexão especificada
            return true; //sinaliza que a conexão ocorreu
        } catch (Exception e) {
            e.printStackTrace();
            return false; //falha de conexao
        }
    }

    public boolean desconectar() {
        try {
            this.conn.close(); //fecha a conexão com a base de dados
            return (true);
        } catch (Exception ex) {
            ex.printStackTrace();
            return (false);
        }
    }

    public ResultSet consultar(String sql) {
        try {
            Statement stmt = this.conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            return rs;
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }

    public boolean comandoStatment(String sql) {
        try {
            Statement stmt = this.conn.createStatement();
            stmt.executeUpdate(sql);
            stmt.close();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public PreparedStatement prepararStatment(String sql) {
        try {
            PreparedStatement stmt = this.conn.prepareStatement(sql);
            return stmt;
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }

    public boolean executarPreparedStatment(PreparedStatement stmt) {
        try {
            int x = stmt.executeUpdate();
            stmt.close();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    //postergar o try...catch para quem for implementar esse método
    public PreparedStatement prepararString(PreparedStatement stmt, int index, String valor) throws Exception {
        stmt.setString(index, valor);
        return stmt;
    }

    public PreparedStatement prepararInt(PreparedStatement stmt, int index, int valor) throws Exception {
        stmt.setInt(index, valor);
        return stmt;
    }

    public PreparedStatement prepararDouble(PreparedStatement stmt, int index, double valor) throws Exception {
        stmt.setDouble(index, valor);
        return stmt;
    }
    
    public PreparedStatement prepararData(PreparedStatement stmt, int index, java.util.Date data) throws Exception {
        stmt.setDate(index, new java.sql.Date(data.getTime()));
        return stmt;
    }

}
