package controller;

import dao.Dao;
import dao.DaoFactory;
import entities.Climber;
import org.jasypt.util.password.ConfigurablePasswordEncryptor;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

public class IdentificationForm {


    private static final String CHAMP_EMAIL                = "email";
    private static final String CHAMP_PASSWORD             = "password";
    private static final String ENCRYPTION_TYPE     = "SHA-256";

    private String result;
    private Map<String,String> errors               = new HashMap<String, String>();
    private final Dao<Climber> climberDao = DaoFactory.getClimberDao();

    public Map<String, String> getErrors() {
        return errors;
    }

    /* ajout message erreur personnalise a la Map d'erreurs */
    private void setErrors (String champ , String message) {
        errors.put(champ, message);
    }

    public String getResult() {
        return result;
    }


    /* Methodes verifications format mail et password valides */
    private void validEmail (String email) throws FormValidationException {
        if (email != null) {
            if ( !email.matches( "([^.@]+)(\\.[^.@]+)*@([^.@]+\\.)+([^.@]+)")) {
                throw new FormValidationException("Merci de saisir une adresse mail valide");
            }
        } else {
            throw new FormValidationException( "Merci de saisir une adresse mail");
        }
    }

    private void validPassword (String password ) throws FormValidationException {
        if (password != null ) {
            if (password.length() < 4 ) {
                throw new FormValidationException("Par mesure de sécurité les mots de passe doivent contenir au moins 4 caractères");
            }
        } else {
            throw new FormValidationException("Veuillez remplir les champs Mot de passe et Confirmation mot de passe");
        }
    }

    /*recupération des valeurs du formulaire */
    private static String getFormValue (HttpServletRequest request, String lineName) {
        String value = request.getParameter(lineName);
        if (value == null || value.trim().length() == 0 ) {
            return null;
        } else {
            return value;
        }
    }




    /* on recupere le grimpeur si deja enregistré */
    public Climber createRegistredClimber (HttpServletRequest request) {
        String email = getFormValue(request , CHAMP_EMAIL);
        String password = getFormValue(request , CHAMP_PASSWORD);

        Climber climber = new Climber();
        try {
            validEmail(email);
            validPassword(password);
        } catch (FormValidationException e) {
            setErrors(CHAMP_EMAIL,e.getMessage());
            setErrors(CHAMP_PASSWORD, e.getMessage());
        }

        /* verif en base de données si grimpeur présent, si oui vérif mot de passe */
        climber = climberDao.findByStringId(email);
        if (climber != null) {

            ConfigurablePasswordEncryptor passwordEncryptor = new ConfigurablePasswordEncryptor();
            passwordEncryptor.setAlgorithm(ENCRYPTION_TYPE);
            passwordEncryptor.setPlainDigest(false);
            boolean decryptedPassword = passwordEncryptor.checkPassword(password, climberDao.findByStringId(email).getPassword());

            if (decryptedPassword) {
                climber = climberDao.findByStringId(email);
            } else climber = null;
        } else {
            setErrors(CHAMP_EMAIL,"Email inconnu");
        }

        return climber;
    }
}
