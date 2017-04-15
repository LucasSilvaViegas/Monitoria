package modelo;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.Escola;
import modelo.Exercicios;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-04-14T21:26:51")
@StaticMetamodel(Professores.class)
public class Professores_ { 

    public static volatile SingularAttribute<Professores, Integer> telefone;
    public static volatile SingularAttribute<Professores, Escola> escola;
    public static volatile ListAttribute<Professores, Exercicios> exerciciosList;
    public static volatile SingularAttribute<Professores, String> nome;
    public static volatile SingularAttribute<Professores, Integer> id;

}