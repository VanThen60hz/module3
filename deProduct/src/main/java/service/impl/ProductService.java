package service.impl;

import model.Product;
import repository.impl.ProductRepository;
import service.IProductService;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;

public class ProductService implements IProductService {

    private ProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> findAll() throws SQLException {
        return productRepository.findAll();
    }

    @Override
    public boolean add(Product product) {
        return productRepository.add(product);
    }

    @Override
    public boolean delete(int id) {
        return productRepository.delete(id);
    }

    @Override
    public boolean edit(int id, String name, BigDecimal price, int quantity, String color, int categoryId) {
        return productRepository.edit(id,name,price,quantity,color,categoryId);
    }

    @Override
    public  List<Product>  findByName(String searchName) {
        return productRepository.findByName(searchName);
    }

}
