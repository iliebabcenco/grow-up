
package dao;

import java.util.List;


public interface ObjectDaoIntf<T> {
    public void save(T obj);
    public void update(T obj);
    public void delete(T obj);
    public T findById(int id);
    public List<T> findAll();
}
