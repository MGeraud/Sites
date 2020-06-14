package dao;


import java.util.List;

public interface Dao<T> {

    T findById(Long id);
    List<T> findAll();
    void save(T entity);
    void update(T entity);
    void delete(T entity);
    List<T> findByMultiParameters(String string , String string2 , String string3 , String string4 );
    List<T> findByPlaceId(Long id);
}
