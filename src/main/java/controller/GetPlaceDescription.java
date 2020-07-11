package controller;

import dao.Dao;
import dao.DaoFactory;
import entities.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/** Chargement en mémoire du site dont on veut la description avec ses secteurs, voies et commentaires
 * A partir de son Id récupérée dans la jsp index
 */
public class GetPlaceDescription {

    /* nom de champ à récupérer dans la jsp */
    private static final String CHAMP_PLACE_ID      = "placeID";
    private static final String CHAMP_COM_ID        = "comId";


    /* nom des attributs de sessions à enregistrer ou récupérer */
    private static final String ATTRIBUT_PLACE                  ="place";
    private static final String ATTRIBUT_SECTORS                ="sectors";
    private static final String ATTRIBUT_COMS                   ="coms";
    public static final String ATT_REGISTRED_SESSION            ="sessionUtilisateur";
    public static final String ATTRIBUT_ADD_COMMENT             ="addComment";
    public static final String ATTRIBUT_MODIFIED_COMMENT        ="modifiedComment";

    /*instanciation des différents Dao via la factory */
    private final Dao<Sector> dao = DaoFactory.getSectorDao();
    private final Dao<Place> placeDao = DaoFactory.getPlaceDao();
    private final Dao<Com> comDao = DaoFactory.getComDao();

    /* création d'une Map pour stocker les messages d'erreur*/
    private Map<String , String > errors = new HashMap<>();
    public Map<String, String> getErrors() {
        return errors;
    }

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
     * enregistrement en session des différents éléments décrivants un site
     * ainsi que les commentaire lié à celui-ci
     */
    public void getPlaceWithAllAttributes (HttpServletRequest request) {

        Long placeId = Long.parseLong(getFormValue(request , CHAMP_PLACE_ID));
        List<Sector> sectors = dao.listSectorsFromPlaceWithRoutes(placeId);
        Place place = placeDao.findById(placeId);
        List<Com> coms = comDao.findByPlaceId(placeId);


        HttpSession session = request.getSession();
        session.setAttribute(ATTRIBUT_SECTORS, sectors);
        session.setAttribute(ATTRIBUT_PLACE , place);
        session.setAttribute(ATTRIBUT_COMS , coms);
    }

    /**
     * Changement de déclaration du tag "site officiel"
     */
    public void updatePlaceTag (HttpServletRequest request) {

        /*
        récupération du site affiché et en fonction de la valeur de son tag, on l'inverse
         */
        HttpSession session = request.getSession();
        Place place = (Place) session.getAttribute(ATTRIBUT_PLACE);
        place.setTag(!place.isTag());
        placeDao.update(place);
    }

    /**
     * Ajout de commentaires liées au site affiché et au grimpeur connecté
     */
    public void addComment (HttpServletRequest request) {

        /*
        récupération du site, du commentaire et du grimpeur
         */
        HttpSession session = request.getSession();
        Place place = (Place) session.getAttribute(ATTRIBUT_PLACE);
        Climber climber = (Climber) session.getAttribute(ATT_REGISTRED_SESSION);
        String addedCom = getFormValue(request,ATTRIBUT_ADD_COMMENT);

        /*
        creation du commentaire à persister
         */
        Com com = new Com();
        com.setClimber(climber);
        com.setComment(addedCom);
        com.setPlace(place);

        /*Utilisation du Validator pour vérifier les contraintes des différents champs
        Récupération des contraintes non respectées dans un set
         */
        ValidatorFactory validatorFactory = Validation.buildDefaultValidatorFactory();
        Validator validator = validatorFactory.getValidator();
        Set<ConstraintViolation<Com>> constraintViolations = validator.validate(com);

        /*
        Si contraintes non respecté on ajoute à la map d'erreurs avec le nom de l'attribut comme clé
        et le message d'erreur comme valeur, sinon enregistrement en base de données
         */
        if (constraintViolations.size() > 0) {
            for (ConstraintViolation<Com> constraintViolation : constraintViolations) {
                errors.put(constraintViolation.getPropertyPath().toString() , constraintViolation.getMessage());
            }
        } else {
            comDao.save(com);
        }
    }

    /**
     * méthode de suppression de commentaire par les membres de l'association
     */
    public void deleteComment (HttpServletRequest request) {

        /* récupération de l'id du commentaire à effacer */
        Long comId = Long.parseLong(getFormValue(request , CHAMP_COM_ID));

        Com comToDelete = new Com();
        comToDelete.setId(comId);

        comDao.delete(comToDelete);
    }

    /**
     * méthode de modification de commentaire par les membres de l'association
     */
    public void updateComment (HttpServletRequest request) {

        /* récupération du pseudo du membre de l'association modifiant le commentaire */
        HttpSession session = request.getSession();
        Climber climber = (Climber) session.getAttribute(ATT_REGISTRED_SESSION);
        String modifiedBy = climber.getNickname();

        /* récupération de l'id du commentaire à modifier */
        Long comId = Long.parseLong(getFormValue(request , CHAMP_COM_ID));
        String modifiedComment = getFormValue(request,ATTRIBUT_MODIFIED_COMMENT);

        /* récupération du commentaire dans la bdd pour le modifier */
        Com modifiedCom = comDao.findById(comId);
        /* stockage des modifications dns le bean ainsi que le pseudo du membre de l'association ayant modifié le commentaire*/
        modifiedCom.setComment(modifiedComment);
        modifiedCom.setModifiedBy(modifiedBy);

        /* modification de la base de donnée*/
        comDao.update(modifiedCom);
    }
}
