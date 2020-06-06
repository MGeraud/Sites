package dao;

import entities.Boulder;

import hibernate.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class BoulderDao implements Dao <Boulder > {

    @Override
    public Boulder findById() {
        return null;
    }

    @Override
    public List<Boulder> findAll() {
        return null;
    }

    @Override
    public void save(Boulder entity) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()){
            transaction = session.beginTransaction();
            session.persist(entity);
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

}
