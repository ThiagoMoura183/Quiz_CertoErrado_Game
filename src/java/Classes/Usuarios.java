/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author mac
 */
public class Usuarios {
    private int ID;
    private String Nome;
    private int Pontos;

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getNome() {
        return Nome;
    }

    public void setNome(String Nome) {
        this.Nome = Nome;
    }

    public int getPontos() {
        return Pontos;
    }

    public void setPontos(int Pontos) {
        this.Pontos = Pontos;
    }
    
    /*1 buscar usuarios */
    /*public ResultSet buscarTodosUsuarios() {
        BancoModels bd = new BancoModels();
        ResultSet rs = null;
        try {
            if (bd.conectar()) {
                String sql = "SELECT * FROM public.\"usuarios\" "
                        + "ORDER BY nome";
                rs = bd.consultar(sql);
            }
         } catch (Exception e) {
             e.printStackTrace();
         }
        return rs;
    } 
    */
    
    /*buscar usuarios (aprimorado)*/
    public ArrayList<Usuarios> buscarTodosUsuarios() {
        BancoModels bd = new BancoModels();
        ArrayList<Usuarios> usuarios = new ArrayList<>();
        try {
            if (bd.conectar()) {
                String sql = "SELECT * FROM public.\"usuarios\" "
                        + "ORDER BY nome";
                ResultSet rs = bd.consultar(sql);
                while (rs.next()){
                    Usuarios u = new Usuarios();
                    u.setID(rs.getInt("id"));
                    u.setNome(rs.getString("nome"));
                    u.setPontos(rs.getInt("pontos"));
                    usuarios.add(u);
                }
            }
         } catch (Exception e) {
             e.printStackTrace();
         }
        return usuarios;
    } 
    
    public boolean inserirUsuario() {
        BancoModels bd = new BancoModels();
        boolean resposta = false;
        try {
            if (bd.conectar()) {
                String sql = "INSERT INTO public.\"usuarios\" (id, nome, pontos)"
                        + "VALUES (?,?,?)";
                PreparedStatement ps = bd.prepararStatment(sql);
                bd.prepararInt(ps, 1, this.getID());
                bd.prepararString(ps, 2, this.getNome());
                bd.prepararInt(ps, 3, 0);
                resposta = bd.executarPreparedStatment(ps);
                bd.desconectar();
            }          
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resposta;
    }
    
    public boolean atualizarPontuacao (int pontos) {
        BancoModels bd = new BancoModels();
        boolean resposta = false;
        try {
            if (bd.conectar()) {
                String sql = "UPDATE public.usuarios set pontos = ? WHERE id = ?";
                PreparedStatement ps = bd.prepararStatment(sql);
                bd.prepararInt(ps, 1, pontos);
                bd.prepararInt(ps, 2, this.getID());
                resposta = bd.executarPreparedStatment(ps);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resposta;
    }
    
    public String listarClassificacao() {
        BancoModels bd = new BancoModels();
        String classificacao = "";
        int posicao = 1;
        try {
            if (bd.conectar()) {
                String sql = "SELECT * FROM public.usuarios order by pontos desc";
                ResultSet rs = bd.consultar(sql);
                while (rs.next()) {
                    classificacao += (posicao++) + " | " + rs.getString("nome")
                            + "\t" + " | " + rs.getInt("pontos") + "<br>";
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return classificacao;
    }
    
    public int buscarPosicao(int id) {
        BancoModels bd = new BancoModels();
        int posicao = 1;
        try {
            if (bd.conectar()) {
                String sql = "SELECT * FROM public.usuarios order by pontos desc";
                ResultSet rs = bd .consultar(sql);
                while(rs.next()){
                    if(rs.getInt("id") == id)
                        return posicao;
                    posicao++;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return posicao;
    }
}
