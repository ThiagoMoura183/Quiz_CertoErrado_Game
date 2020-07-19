/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author mac
 */
public class Perguntas {
    private int id_q;
    private String pergunta;
    private char resposta;

    public int getId_q() {
        return id_q;
    }

    public void setId_q(int id_q) {
        this.id_q = id_q;
    }

    public String getPergunta() {
        return pergunta;
    }

    public void setPergunta(String pergunta) {
        this.pergunta = pergunta;
    }

    public char getResposta() {
        return resposta;
    }

    public void setResposta(char resposta) {
        this.resposta = resposta;
    }
    
    public ArrayList<Perguntas> buscarPerguntas() {
        BancoModels bd = new BancoModels();
        ArrayList<Perguntas> perguntas = new ArrayList();
        try {
            if (bd.conectar()){
                String sql = "SELECT * FROM public.perguntas order by random()";
                ResultSet rs = bd.consultar(sql);
                
                while (rs.next()){
                    Perguntas p = new Perguntas();
                    p.setId_q(rs.getInt("id_q"));
                    p.setPergunta(rs.getString("pergunta"));
                    p.setResposta(rs.getString("resposta").charAt(0));
                    
                    perguntas.add(p);
                }
            } 
        } catch (Exception e) {
            e.printStackTrace();
        }
        return perguntas;
    }
    
}
