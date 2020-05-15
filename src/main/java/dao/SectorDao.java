package dao;

import entities.Place;
import entities.Sector;
import hibernate.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.persistence.NoResultException;
import java.util.List;

public class SectorDao {

    private static final String searchById_jpql      = "SELECT s from Sector s WHERE s.id=:sectorId";
    private static final String PARAMETER_sectorId                      = "sectorId";

    public List listSectorFromPlace (Long placeId) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            String longPlaceId = "longPlaceId";
            return session.createQuery("SELECT s FROM Sector s WHERE s.place.placeId =: longPlaceId").setParameter(longPlaceId,placeId).getResultList();
        }
    }

    public List<Sector> listAllSectors() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()){
            return session.createQuery("SELECT s FROM Sector s" , Sector.class).getResultList();
        } catch (Exception e) {
            throw new DaoException(e);
        }
    }

    public void createSector (Sector sector) throws DaoException {
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

    public Sector searchSectorById(Long sectorId) throws DaoException{
        Transaction transaction = null;
        Sector sector = null;

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();

            sector = (Sector) session.createQuery(searchById_jpql).setParameter(PARAMETER_sectorId, sectorId).uniqueResult();
            transaction.commit();
        } catch (NoResultException e) {
            return null;
        }catch (Exception e) {
            if (transaction != null){
                transaction.rollback();
            }
            throw new DaoException(e);
        }
        return sector;
    }
}
