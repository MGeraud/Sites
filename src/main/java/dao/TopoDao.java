package dao;

import entities.Topo;
import hibernate.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class TopoDao extends ClimberDao<Topo>  {
    private static final String PARAMETER_email                      = "email";
    private static final String PARAMETER_id                    = "id";

    @Override
    public Topo findById(Long id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()){
            return session.createQuery("SELECT t FROM Topo t WHERE t.id=:id "  , Topo.class).setParameter(PARAMETER_id,id).getSingleResult();
        } catch (Exception e) {
            throw new DaoException(e);
        }

    }

    @Override
    public List<Topo> findAll() {
        return null;
    }

    @Override
    public List<Topo> findByClimber(String email) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()){
            return session.createQuery("SELECT t FROM Topo t WHERE t.climber.email=:email "  , Topo.class).setParameter(PARAMETER_email,email).getResultList();
        } catch (Exception e) {
            throw new DaoException(e);
        }

    }

    @Override
    public void save(Topo topo) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()){
            transaction = session.beginTransaction();
            session.persist(topo);
            transaction.commit();

        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            throw new DaoException(e);
        }
    }

    @Override
    public void update(Topo topo) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()){
            transaction = session.beginTransaction();
            session.merge(topo);
            transaction.commit();

        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            throw new DaoException(e);
        }
    }

    @Override
    public void delete(Topo entity) {

    }
}
