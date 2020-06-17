package dao;

import entities.Topo;
import Utils.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class TopoDao implements Dao<Topo>  {
    private static final String PARAMETER_email                         = "email";
    private static final String PARAMETER_topoName                      = "topoName";
    private static final String PARAMETER_topoPlace                     = "topoPlace";

    @Override
    public Topo findById(Long id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()){
            return session.find(Topo.class , id);
        } catch (Exception e) {
            throw new DaoException(e);
        }
    }

    @Override
    public Topo findByStringId(String id) {
        return null;
    }

    @Override
    public List<Topo> findByString(String email) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()){
            return session.createQuery("SELECT t FROM Topo t WHERE t.climber.email=:email "  , Topo.class).setParameter(PARAMETER_email,email).getResultList();
        } catch (Exception e) {
            throw new DaoException(e);
        }    }

    @Override
    public List<Topo> findAll() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()){
            return session.createQuery("SELECT t FROM Topo t" , Topo.class).getResultList();
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
            session.close();

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

    @Override
    public List<Topo> findByMultiParameters(String string, String string2, String string3, String string4) {
        return null;
    }

    @Override
    public List<Topo> findByPlaceId(Long id) {
        return null;
    }

    @Override
    public List<Topo> listSectorsFromPlaceWithRoutes(Long placeId) {
        return null;
    }

    @Override
    public List<Topo> findBy2Parameters(String topoName, String topoPlace) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()){


            return session.createQuery("SELECT t FROM Topo t " +
                            "WHERE (t.topoName=:topoName OR :topoName is null) " +
                            "AND (t.topoPlace=:topoPlace OR :topoPlace is null)"
                    , Topo.class)
                    .setParameter(PARAMETER_topoName,topoName)
                    .setParameter(PARAMETER_topoPlace,topoPlace)
                    .getResultList();
        } catch (Exception e) {
            throw new DaoException(e);
        }
    }
}
