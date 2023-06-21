package repository;

import model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepositoryImpl implements ProductRepository {
    private static Map<Integer, Product> products;

    static {
        products = new HashMap<>();
        products.put(1,new Product(1, "iPhone14", 999.99, 10, "The latest smartphone from Apple."));
        products.put(2,new Product(2, "Samsung Galaxy S23", 899.99, 8, "A powerful Android smartphone."));
        products.put(3,new Product(3, "Google Pixel 3XL", 799.99, 5, "A flagship smartphone by Google."));
        products.put(4,new Product(4, "OnePlus", 699.99, 6, "A premium Android smartphone."));
        products.put(5,new Product(5, "Huawei P Series", 599.99, 4, "High-performance smartphones by Huawei."));
        products.put(6,new Product(6, "Xiaomi S Series", 499.99, 3, "Affordable and feature-packed smartphones by Xiaomi."));

    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public Product findByName(String name) {
        for (Product product : products.values()) {
            if (product.getName().equalsIgnoreCase(name)) {
                return product;
            }
        }
        return null;
    }

    @Override
    public void update(int id, Product product) {
        products.put(id,product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }
}
