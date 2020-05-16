package dao;

import entities.Climber;
import hibernate.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.persistence.NoResultException;
import javax.persistence.Query;

public class UserDao{

    /* Creation et inscription utilisateur */

    private static final String jpql_search_climber                  = "SELECT c from Climber c WHERE c.email=:email";
    private static final String PARAMETER_email                      = "email";

    public void createClimber (Climber climber) throws DaoException {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()){
            transaction = session.beginTransaction();
            session.persist(climber);
            transaction.commit();

        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            throw new DaoException(e);
        }
    }

    /* methode de recherche existence dans la bdd pour éviter doublons lors de la création utilisateur
    et pour vérifier existence lors de la connexion d'un utilisateur
     */

    public Climber searchClimber (String email) throws DaoException {
        Transaction transaction = null;
        Climber climber = null;

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();

            climber = (Climber) session.createQuery(jpql_search_climber).setParameter(PARAMETER_email, email).uniqueResult();
            transaction.commit();
        } catch (NoResultException e) {
            return null;
        }catch (Exception e) {
            if (transaction != null){
                transaction.rollback();
            }
            throw new DaoException(e);
        }
        return climber;
    }

    public Climber searchRegistredClimber (String email ) throws DaoException {
        Transaction transaction = null;
        Climber climber = null;

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();

            climber =  session.get(Climber.class , email);
            transaction.commit();
        } catch (NoResultException e) {
            return null;
        }catch (Exception e) {
            if (transaction != null){
                transaction.rollback();
            }
            throw new DaoException(e);
        }
        return climber;
    }

}
