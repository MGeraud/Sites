package dao;

import entities.Place;
import entities.Sector;
import hibernate.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class SectorDao {

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
}
