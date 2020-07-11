package controller;

/**
 * méthode attribuant les messages personnalisés lors de la levée d'exception
 */
public class FormValidationException extends Exception {
    public FormValidationException(String message ) {
        super(message);
    }
}

