package service;

import model.Product;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;

public interface IProductService {
    List<Product> findAll() throws SQLException;

    boolean add(Product product);

    boolean delete(int id);

    boolean edit(int id, String name, BigDecimal price, int quantity, String color, int categoryId);

    List<Product>  findByName(String searchName);
}
