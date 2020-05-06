package dao;

import entities.Boulder;
import entities.Place;
import entities.Sector;
import hibernate.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class BoulderDao {

    public void createRoute (Place place, Sector sector , Boulder route) throws DaoException {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()){
            transaction = session.beginTransaction();
            session.persist(place);
            session.persist(sector);
            session.persist(route);
            transaction.commit();

        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            throw new DaoException(e);
        }
    }
}
