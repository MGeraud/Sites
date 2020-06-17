package dao;


import java.util.List;

public interface Dao<T> {

    T findById(Long id);
    T findByStringId(String id);
    void save(T entity);
    void update(T entity);
    void delete(T entity);
    List<T> findByMultiParameters(String string , String string2 , String string3 , String string4 );
    List<T> findByPlaceId(Long id);
    List<T> listSectorsFromPlaceWithRoutes(Long placeId);
    List<T> findBy2Parameters(String string, String string2);
    List<T> findByString(String string);
    List<T> findAll();
}
