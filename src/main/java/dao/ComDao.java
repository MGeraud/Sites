package dao;

import Utils.HibernateUtil;
import entities.Com;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class ComDao implements Dao<Com>{
    private static final String PARAMETER_id    = "id";


    @Override
    public Com findById(Long id) {
        return null;
    }

    @Override
    public List<Com> findAll() {
        return null;
    }

    @Override
    public void save(Com com) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()){
            transaction = session.beginTransaction();
            session.persist(com);
            transaction.commit();

        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            throw new DaoException(e);
        }

    }

    @Override
    public void update(Com entity) {

    }

    @Override
    public void delete(Com entity) {

    }

    @Override
    public List findByMultiParameters(String string, String string2, String string3, String string4) {
        return null;
    }

    @Override
    public List findByPlaceId(Long id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()){
            return session.createQuery("SELECT c FROM Com c " +
                    "WHERE c.place.placeId=:id "
                    , Com.class)
                    .setParameter(PARAMETER_id,id)
                    .getResultList();
        } catch (Exception e) {
            throw new DaoException(e);
        }
    }
}
