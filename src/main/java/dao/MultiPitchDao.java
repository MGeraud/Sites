package dao;

import Utils.HibernateUtil;
import entities.MultiPitch;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class MultiPitchDao implements Dao <MultiPitch> {

    @Override
    public MultiPitch findById(Long id) {
        return null;
    }

    @Override
    public List findAll() {
        return null;
    }

    @Override
    public void save(MultiPitch multiPitch) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()){
            transaction = session.beginTransaction();
            session.persist(multiPitch);
            transaction.commit();

        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            throw new DaoException(e);
        }
    }

    @Override
    public void update(MultiPitch multiPitch) {

    }

    @Override
    public void delete(MultiPitch multiPitch) {

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
