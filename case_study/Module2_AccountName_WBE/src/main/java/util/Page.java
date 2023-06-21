package util;

import java.util.List;

public interface Page<T> {
    List<T> getContent();
    int getNumber();
    int getPageSize();
    int getTotalPages();
    long getTotalElements();
    boolean hasNext();
    boolean hasPrevious();
}
