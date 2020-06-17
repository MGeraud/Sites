package dao;

import entities.Climber;
import Utils.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class ClimberDao implements Dao<Climber>{

    @Override
    public Climber findById(Long id) {
        return null;
    }

    @Override
    public Climber findByStringId(String id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()){
            return session.find(Climber.class , id);
        } catch (Exception e) {
            throw new DaoException(e);
        }
    }

    @Override
    public void save(Climber climber) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()){
            transaction = session.beginTransaction();
            session.persist(climber);
            transaction.commit();

        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            throw new DaoException(e);
        }
    }

    @Override
    public void update(Climber entity) {

    }

    @Override
    public void delete(Climber entity) {

    }

    @Override
    public List<Climber> findByMultiParameters(String string, String string2, String string3, String string4) {
        return null;
    }

    @Override
    public List<Climber> findByPlaceId(Long id) {
        return null;
    }

    @Override
    public List<Climber> listSectorsFromPlaceWithRoutes(Long placeId) {
        return null;
    }

    @Override
    public List<Climber> findBy2Parameters(String string, String string2) {
        return null;
    }

    @Override
    public List<Climber> findByString(String string) {
        return null;
    }

    @Override
    public List<Climber> findAll() {
        return null;
    }
}
