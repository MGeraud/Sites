package dao;

import Utils.HibernateUtil;
import entities.SinglePitch;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class SinglePitchDao implements Dao<SinglePitch> {
    @Override
    public SinglePitch findById(Long id) {
        return null;
    }

    @Override
    public List findAll() {
        return null;
    }

    @Override
    public void save(SinglePitch singlePitch) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()){
            transaction = session.beginTransaction();
            session.persist(singlePitch);
            transaction.commit();

        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            throw new DaoException(e);
        }
    }

    @Override
    public void update(SinglePitch singlePitch) {

    }

    @Override
    public void delete(SinglePitch singlePitch) {

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
