package controller;

import dao.Dao;
import dao.DaoFactory;
import entities.Climber;
import entities.Topo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 * Traitement du formulaire de création d'un nouveau topo
 * Appel a climberDao pour mettre en base de données le nouveau topo
 */
public class CreateTopoForm {

    public static final String ATT_REGISTRED_SESSION            ="sessionUtilisateur";

    /* noms des champs définis dans la jsp */
    private static final String CHAMP_TOPO_NAME                 ="topoName";
    private static final String CHAMP_TOPO_PLACE                ="topoPlace";
    private static final String CHAMP_TOPO_DESCRIPTION          ="topoDescription";
    private static final String CHAMP_TOPO_YEAR                 ="topoYear";
    private static final String CHAMP_TOPO_AVAILABLE            ="topoAvailable";

    private Map <String , String > errors = new HashMap<>();

    public Map<String, String> getErrors() {
        return errors;
    }

    /*instanciation des différents Dao via la factory */
    private final Dao<Topo> dao = DaoFactory.getTopoDao();

    /**  méthode récupération des valeurs du champ du formulaire */
    private static String getFormValue(HttpServletRequest request, String lineName) {
        String value = request.getParameter(lineName);
        if (value == null || value.trim().length() == 0) {
            return null;
        } else {
            return value;
        }
    }

    /**
     * récupération des valeurs des champs pour les attribuer à l'entité topo avant de la sauvegarder en bdd
     * récupération du grimpeur enregistré en session pour lui lier le topo
     */
    public void createTopo(HttpServletRequest request) {

        /*
        Récupération des différentes valeurs entrées et de l'utilisateur connecté
         */
        HttpSession session = request.getSession();
        Climber climber = (Climber) session.getAttribute(ATT_REGISTRED_SESSION);
        String topoName =getFormValue(request,CHAMP_TOPO_NAME);
        String topoPlace = getFormValue(request,CHAMP_TOPO_PLACE);
        String topoDescription = getFormValue(request,CHAMP_TOPO_DESCRIPTION);
        int year = Integer.parseInt(getFormValue(request,CHAMP_TOPO_YEAR));
        boolean available = getFormValue(request, CHAMP_TOPO_AVAILABLE) != null ;

        /*
        Attribution des différentes valeur entrées au bean
         */
        Topo topo = new Topo();
        topo.setTopoAvailable(available);
        topo.setTopoName(topoName);
        topo.setTopoPlace(topoPlace);
        topo.setYear(year);
        topo.setTopoDescription(topoDescription);
        topo.setClimber(climber);

        /*Utilisation du Validator pour vérifier les contraintes des différents champs
        Récupération des contraintes non respectées dans un set
         */
        ValidatorFactory validatorFactory = Validation.buildDefaultValidatorFactory();
        Validator validator = validatorFactory.getValidator();
        Set<ConstraintViolation<Topo>> constraintViolations = validator.validate(topo);

        /*
        Si contraintes non respecté on ajoute à la map d'erreurs avec le nom de l'attribut comme clé
        et le message d'erreur comme valeur, sinon enregistrement en base de données
         */
        if (constraintViolations.size() > 0) {
            for (ConstraintViolation<Topo> constraintViolation : constraintViolations) {
                errors.put(constraintViolation.getPropertyPath().toString() , constraintViolation.getMessage());
            }
        } else {
            dao.save(topo);
        }
    }
}
