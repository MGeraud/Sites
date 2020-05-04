package dao;

import entities.Climber;
import entities.Place;
import entities.Route;
import entities.Sector;
import hibernate.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class RouteDao {

    public void createRoute (Place place, Sector sector ,Route route) throws DaoException {
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
