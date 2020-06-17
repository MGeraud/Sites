package dao;

import Utils.FoundRoute;
import Utils.HibernateUtil;
import entities.Region;
import org.hibernate.Session;

import java.util.List;

public class RouteDao implements Dao {

    private final String PARAMETER_REGION = "byregion";
    private final String PARAMETER_ROUTE_TYPE = "byRouteType";
    private final String PARAMETER_PLACE_ID = "placeId";

    @Override
    public List findByMultiParameters(String byregion, String byRouteType, String byGrade, String countainText) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("SELECT new Utils.FoundRoute(route.sector.place.placeId , route.sector.place.placeName , route.routeType , route.routeName , route.grade) " +
                            "FROM Route route " +
                            " WHERE route.sector.place.region= :byregion " +
                            " AND (route.routeType= :byRouteType OR :byRouteType is null ) " +
                            " AND (route.grade LIKE  ?3 ) " +
                            " AND (( route.routeName  LIKE ?4 ) " +
                            " OR ( route.sector.sectorName LIKE ?4 ) " +
                            " OR ( route.sector.place.placeName LIKE ?4 ) " +
                            " OR ( route.routeDescription LIKE ?4 ) " +
                            " OR ( route.sector.sectorDescription LIKE ?4 ) " +
                            " OR ( route.sector.place.placeDescription LIKE ?4 ))"

                    , FoundRoute.class)
                    .setParameter(PARAMETER_REGION, Region.valueOf(byregion))
                    .setParameter(PARAMETER_ROUTE_TYPE, byRouteType)
                    .setParameter(3, byGrade)
                    .setParameter(4, countainText)
                    .getResultList();
        } catch (Exception e) {
            throw new DaoException(e);
        }
    }

    @Override
    public List findByPlaceId(Long placeId) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("SELECT routes" +
                    " FROM Route routes " +
                    "WHERE routes.sector.place.placeId= :placeId")
                    .setParameter(PARAMETER_PLACE_ID, placeId)
                    .getResultList();
        } catch (Exception e) {
            throw new DaoException(e);
        }
    }

    @Override
    public List listSectorsFromPlaceWithRoutes(Long placeId) {
        return null;
    }

    @Override
    public List findBy2Parameters(String string, String string2) {
        return null;
    }


    @Override
    public Object findById(Long id) {
        return null;
    }

    @Override
    public Object findByStringId(String id) {
        return null;
    }

    @Override
    public List<Object> findByString(String string) {
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
