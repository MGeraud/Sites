package dao;

import entities.Place;
import Utils.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class PlaceDao implements Dao <Place>{


    @Override
    public Place findById(Long placeId) throws DaoException{
        try (Session session = HibernateUtil.getSessionFactory().openSession()){
            return session.find(Place.class , placeId);
        } catch (Exception e) {
            throw new DaoException(e);
        }
    }

    @Override
    public Place findByStringId(String id) {
        return null;
    }

    @Override
    public List<Place> findByString(String string) {
        return null;
    }

    @Override
    public List findAll() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()){
            return session.createQuery("SELECT p FROM Place p" , Place.class).getResultList();
        } catch (Exception e) {
            throw new DaoException(e);
        }
    }

    @Override
    public void save(Place place) throws DaoException {
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

    @Override
    public void update(Place place) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()){
            transaction = session.beginTransaction();
            session.update(place);
            transaction.commit();

        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            throw new DaoException(e);
        }
    }

    @Override
    public void delete(Place place) {

    }

    @Override
    public List findByMultiParameters(String string, String string2, String string3, String string4) {
        return null;
    }

    @Override
    public List findByPlaceId(Long id) {
        return null;
    }

    @Override
    public List<Place> listSectorsFromPlaceWithRoutes(Long placeId) {
        return null;
    }

    @Override
    public List<Place> findBy2Parameters(String string, String string2) {
        return null;
    }


}
