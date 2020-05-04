package dao;

import entities.Place;
import hibernate.HibernateUtil;
import org.hibernate.Session;

import java.util.List;

public class PlaceDao {

    public List<Place> listAllPlaces() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()){
            return session.createQuery("SELECT p FROM Place p" , Place.class).getResultList();
        } catch (Exception e) {
           throw new DaoException(e);
        }
    }
}
