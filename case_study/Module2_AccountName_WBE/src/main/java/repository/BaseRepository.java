package repository;

import util.Page;
import util.Pageable;

import java.util.List;

public interface BaseRepository<T> {
    List<T> findAll();
    Page<T> findAll(Pageable pageable);
    int save(T t);
    List<T> find(String q);
    int delete(int id);
}
