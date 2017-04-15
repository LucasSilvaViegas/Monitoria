package modelo;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.Professores;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-04-14T21:26:51")
@StaticMetamodel(Escola.class)
public class Escola_ { 

    public static volatile ListAttribute<Escola, Professores> professoresList;
    public static volatile SingularAttribute<Escola, String> endereco;
    public static volatile SingularAttribute<Escola, String> nome;
    public static volatile SingularAttribute<Escola, Integer> id;

}