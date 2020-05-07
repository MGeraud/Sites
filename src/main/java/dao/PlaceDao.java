package dao;

import entities.Climber;
import entities.Place;
import hibernate.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.persistence.NoResultException;
import java.util.List;

public class PlaceDao {

    private static final String searchById_jpql      = "SELECT p from Place p WHERE p.placeId=:placeId";
    private static final String PARAMETER_placeId                      = "placeId";
    public List<Place> listAllPlaces() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()){
            return session.createQuery("SELECT p FROM Place p" , Place.class).getResultList();
        } catch (Exception e) {
           throw new DaoException(e);
        }
    }

    public void createPlace (Place place) throws DaoException {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()){
            transaction = session.beginTransaction();
            session.persist(place);
            transaction.commit();

        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            throw new DaoException(e);
        }
    }

    public Place searchPlaceById( Long placeId) throws DaoException{
        Transaction transaction = null;
        Place place = null;

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();

            place = (Place) session.createQuery(searchById_jpql).setParameter(PARAMETER_placeId, placeId).uniqueResult();
            transaction.commit();
        } catch (NoResultException e) {
            return null;
        }catch (Exception e) {
            if (transaction != null){
                transaction.rollback();
            }
            throw new DaoException(e);
        }
        return place;
    }
}
