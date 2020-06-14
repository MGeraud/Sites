package dao;

import entities.Place;
import Utils.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.persistence.NoResultException;
import java.util.List;

public class PlaceDao implements Dao <Place>{

    private static final String searchById_jpql      = "SELECT p from Place p WHERE p.placeId=:placeId";
    private static final String PARAMETER_placeId                      = "placeId";
    @Override
    public Place findById(Long placeId) throws DaoException{
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


}
