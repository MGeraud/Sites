package dao;

import java.util.List;

public interface ClimberDao <T>{

    T findById();
    List<T> findAll();
    void save(T entity);
    void update(T entity);
    void delete(T entity);
}
