package dao;

import entities.Climber;
import entities.Place;
import entities.Topo;
import hibernate.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.persistence.NoResultException;
import javax.servlet.http.HttpSession;
import java.util.List;

public class TopoDao extends ClimberDao<Topo>  {
    private static final String PARAMETER_email                      = "email";

    @Override
    public Topo findById() {
        return null;
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
       /* Transaction transaction = null;

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();

             =  session.get(Climber.class , email);
            transaction.commit();
        } catch (NoResultException e) {
            return null;
        }catch (Exception e) {
            if (transaction != null){
                transaction.rollback();
            }
            throw new DaoException(e);
        }
        return climber; */
    }

    @Override
    public void save(Topo entity) {
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
    public void update(Topo entity) {

    }

    @Override
    public void delete(Topo entity) {

    }
}
