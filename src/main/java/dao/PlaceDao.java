package dao;

import entities.Climber;
import entities.Place;
import hibernate.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class PlaceDao {

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
}
