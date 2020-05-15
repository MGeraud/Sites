package dao;

import javax.persistence.Id;
import java.io.Serializable;
import java.util.List;

public interface Dao<T ,Id extends Serializable> {

    T findById(Id id);
    List<T> findAll();
    void save(T entity);
    void update(T entity);
    void delete(T entity);

}
