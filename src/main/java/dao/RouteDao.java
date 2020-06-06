package dao;

import entities.Topo;
import hibernate.HibernateUtil;
import org.hibernate.Session;

import java.util.List;

public class RouteDao implements Dao{

    @Override
    public List findByMultiParameters(String string, String string2, String string3, String string4) {
       /*try (Session session = HibernateUtil.getSessionFactory().openSession()){


           return session.createNativeQuery("SELECT place.placeid,place.placename,route.dtype,route.routename,route.grade " +
                            "FROM place " +
                            "JOIN route " +
                            "WHERE (placeid = ?1 OR ?1 is null) " +
                            "AND (route.dtype = ?2 OR ?2 is null)" +
                            "AND (route.grade = )"

                    , Topo.class)
                    .setParameter(PARAMETER_topoName,topoName)
                    .setParameter(PARAMETER_topoPlace,topoPlace)
                    .getResultList();
        } catch (Exception e) {
            throw new DaoException(e);
        } */
        return null;
    }

    @Override
    public Object findById() {
        return null;
    }

    @Override
    public List findAll() {
        return null;
    }

    @Override
    public void save(Object entity) {

    }

    @Override
    public void update(Object entity) {

    }

    @Override
    public void delete(Object entity) {

    }


}
