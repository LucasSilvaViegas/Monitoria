/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import modelo.Professores;

/**
 *
 * @author aluno
 */
public class ProfessoresDAO extends GenericDAO<Professores, Integer> {

    public ProfessoresDAO() {
        super(Professores.class);
    }
}