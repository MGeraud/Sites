package dao;

import entities.Boulder;

import Utils.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class BoulderDao implements Dao <Boulder > {


    @Override
    public Boulder findById(Long id) {
        return null;
    }

    @Override
    public Boulder findByStringId(String id) {
        return null;
    }

    @Override
    public List<Boulder> findByString(String string) {
        return null;
    }

    @Override
    public List<Boulder> findAll() {
        return null;
    }

    @Override
    public void save(Boulder boulder) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()){
            transaction = session.beginTransaction();
            session.persist(boulder);
            transaction.commit();

        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            throw new DaoException(e);
        }

    }

    @Override
    public void update(Boulder entity) {

    }

    @Override
    public void delete(Boulder entity) {

    }

    @Override
    public List<Boulder> findByMultiParameters(String string, String string2, String string3, String string4) {
        return null;
    }

    @Override
    public List<Boulder> findByPlaceId(Long id) {
        return null;
    }

    @Override
    public List<Boulder> listSectorsFromPlaceWithRoutes(Long placeId) {
        return null;
    }

    @Override
    public List<Boulder> findBy2Parameters(String string, String string2) {
        return null;
    }

}
