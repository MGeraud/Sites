package controller;

import dao.Dao;
import dao.DaoException;
import dao.DaoFactory;
import entities.Climber;
import org.jasypt.util.password.ConfigurablePasswordEncryptor;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * Traitement du formulaire d'inscription de grimpeur
 */
public class InscriptionForm {

    /* nom des différents champs du formulaire*/
    private static final String CHAMP_EMAIL                = "email";
    private static final String CHAMP_PASSWORD             = "password";
    private static final String CHAMP_CONFIRMATION         = "confirmation";
    private static final String CHAMP_NICKNAME             = "nickname";
    private static final String CHAMP_ASSOCIATION          = "association";

    /* Choix de l'algorythme d'encodage du mot de passe*/
    private static final String ENCRYPTION_TYPE     = "SHA-256";

    /* Création d'une Map de stockage des différents messages d'erreur*/
    private String result;
    private Map<String,String> errors               = new HashMap<String, String>();

    /* instanciation de la dao via la do factory*/
    private Dao<Climber> climberDao = DaoFactory.getClimberDao();


    public Map<String, String> getErrors() {
        return errors;
    }

    /** ajout message erreur personnalise a la Map d'erreurs */
    private void setErrors (String champ , String message) {
        errors.put(champ, message);
    }

    public String getResult() {
        return result;
    }


     /**récupération des valeurs du champ du formulaire */
    private static String getFormValue (HttpServletRequest request, String lineName) {
        String value = request.getParameter(lineName);
        if (value == null || value.trim().length() == 0 ) {
            return null;
        } else {
            return value;
        }
    }

    /**
    Methodes de validation du remplissage des differents champs du formulaire avec creation de messages specifique selon les erreurs
     */

    private void validEmail (String email) throws FormValidationException {
        if (email != null) {
            if ( !email.matches( "([^.@]+)(\\.[^.@]+)*@([^.@]+\\.)+([^.@]+)")) {
                throw new FormValidationException("Merci de saisir une adresse mail valide");
            }else if (climberDao.findByStringId(email) != null) {
                throw new FormValidationException("Cette adresse mail est déjà utilisée");
            }
        } else {
            throw new FormValidationException( "Merci de saisir une adresse mail");
        }
    }

    private void validPassword (String password , String confirmation) throws FormValidationException {
        if (password != null && confirmation != null) {
            if (!password.equals(confirmation)) {
                throw new FormValidationException("Le mot de passe et sa confirmation sont différents l'un de l'autre");
            } else if (password.length() < 4 ) {
                throw new FormValidationException("Par mesure de sécurité les mots de passe doivent contenir au moins 4 caractères");
            }
        } else {
            throw new FormValidationException("Veuillez remplir les champs Mot de passe et Confirmation mot de passe");
        }
    }

    private void validNickName (String nickName) throws FormValidationException {
        if (nickName != null) {
            if (nickName.trim().length() < 3 ) {
                throw new FormValidationException("le pseudonime doit contenir au moins 3 caractères ");
            }
        } else {
            throw new FormValidationException("Merci de saisir un pseudonime");
        }
    }

    /** Methodes de traitement des donnees pour les attribuer a l'entite climber si champs validés par les méthodes valid... */

    private void setClimberEmail (String email , Climber climber) {
        try {
            validEmail(email);
        } catch (FormValidationException e) {
            setErrors(CHAMP_EMAIL,e.getMessage());
        }
        climber.setEmail(email);
    }

    private void setClimberPassword (String password , String confirmation , Climber climber) {
        try {
            validPassword(password,confirmation);
        } catch (FormValidationException e) {
            setErrors(CHAMP_PASSWORD, e.getMessage());
            setErrors(CHAMP_CONFIRMATION,null);
        }
        /* encripter password avant archivage, utilisation librairie Jasyp */
        ConfigurablePasswordEncryptor passwordEncryptor = new ConfigurablePasswordEncryptor();
        passwordEncryptor.setAlgorithm( ENCRYPTION_TYPE);
        passwordEncryptor.setPlainDigest(false);
        String encryptedPassword = passwordEncryptor.encryptPassword(password);

        climber.setPassword(encryptedPassword);
    }

    private void setNickName (String nickName , Climber climber) {
        try {
            validNickName(nickName);
        } catch (FormValidationException e) {
            setErrors(CHAMP_NICKNAME , e.getMessage());
        }
        climber.setNickname(nickName);
    }


    /**
     * création du grimpeur et enregistrement en base de données
     */
    public Climber createClimber (HttpServletRequest request) {
        /* récupération des donnés des différents champs des formulaires*/
        String email = getFormValue(request , CHAMP_EMAIL);
        String password = getFormValue(request , CHAMP_PASSWORD);
        String confirmation = getFormValue(request , CHAMP_CONFIRMATION);
        String nickname = getFormValue(request, CHAMP_NICKNAME);
        String association = getFormValue(request , CHAMP_ASSOCIATION);
        Climber climber = new Climber();
        /*attribution des différentes valeurs au grimpeur si valides et enregistrement si pas d'erreurs*/
        if (association != null) {
            climber.setAssociation(true);
        } else climber.setAssociation(false);

        try {
            setClimberEmail(email , climber);
            setClimberPassword(password,confirmation,climber);
            setNickName(nickname , climber);

            if (errors.isEmpty()) {
                climberDao.save(climber);
            } else {
                result = "Echec de l'inscription";
            }
        } catch (DaoException e) {
            result = "Un incident est survenue durant votre inscription, veuillez re-essayer dans un instant.";
            e.printStackTrace();
        }
        return climber;
    }
}
