package dao;

import javax.persistence.Id;
import java.io.Serializable;
import java.util.List;

public interface Dao<T> {

    T findById();
    List<T> findAll();
    void save(T entity);
    void update(T entity);
    void delete(T entity);

}
