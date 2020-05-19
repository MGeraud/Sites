package dao;

import java.util.List;

public abstract class ClimberDao <T >{

    public abstract T findById(Long id);
    public abstract List<T> findAll();
    public abstract List<T> findByClimber(String email);
    public abstract List<T> findBy2Parameters(String string, String string2);
    public abstract void save(T entity);
    public abstract void update(T entity);
    public abstract void delete(T entity);
}
