package dao;

import entities.Sector;
import Utils.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class SectorDao implements Dao<Sector>{

    private static final String PARAMETER_PLACE_ID                      ="placeId";

    @Override
    public Sector findById(Long sectorId) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()){
            return session.find(Sector.class , sectorId);
        } catch (Exception e) {
            throw new DaoException(e);
        }
    }

    @Override
    public Sector findByStringId(String id) {
        return null;
    }

    @Override
    public List<Sector> findByString(String string) {
        return null;
    }

    @Override
    public List<Sector> findAll() {
        return null;
    }

    @Override
    public void save(Sector sector) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()){
            transaction = session.beginTransaction();
            session.persist(sector);
            transaction.commit();

        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            throw new DaoException(e);
        }
    }

    @Override
    public void update(Sector entity) {

    }

    @Override
    public void delete(Sector entity) {

    }

    @Override
    public List<Sector> findByMultiParameters(String string, String string2, String string3, String string4) {
        return null;
    }

    @Override
    public List<Sector> findByPlaceId(Long placeId) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("SELECT s FROM Sector s WHERE s.place.placeId = :placeId ").setParameter(PARAMETER_PLACE_ID,placeId).getResultList();
        }    }

    @Override
    public List<Sector> listSectorsFromPlaceWithRoutes(Long placeId) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()){
            return session.createQuery("SELECT DISTINCT s FROM Sector s" +
                            " JOIN FETCH s.routes " +
                            " WHERE s.place.placeId= :placeId"
                    , Sector.class)
                    .setParameter(PARAMETER_PLACE_ID , placeId)
                    .getResultList();
        } catch (Exception e) {
            throw new DaoException(e);
        }    }


    @Override
    public List<Sector> findBy2Parameters(String string, String string2) {
        return null;
    }
}
