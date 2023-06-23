package repository.impl;

import model.Product;
import repository.BaseRepository;
import repository.IProductRepository;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private final String SELECT_INFO ="select * from product;";
    private final String INSERT_INTO = "insert into product(name, price, quantity, color, category_id) values(?,?,?,?,?);";
    private final String DELETE_BY_ID = "call delete_by_id(?)";
    private final String EDIT_PRODUCT = "call edit_product(?, ?, ?, ?, ?, ?);";
    private final String FIND_BY_NAME = "call search_product(?);";



    @Override
    public List<Product> findAll() throws SQLException {
        List<Product> productList = new ArrayList<>();
        // kết nối db
        try (Connection connection = BaseRepository.getConnectDB()) {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_INFO);
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    BigDecimal price = resultSet.getBigDecimal("price");
                    int quantity = resultSet.getInt("quantity");
                    String color = resultSet.getString("color");
                    int categoryId = resultSet.getInt("category_id");
                    Product product = new Product(id,name,price,quantity,color,categoryId);
                    productList.add(product);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return productList;
    }

    @Override
    public boolean add(Product product) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
            preparedStatement.setString(1,product.getName());
            preparedStatement.setBigDecimal(2,product.getPrice());
            preparedStatement.setInt(3,product.getQuantity());
            preparedStatement.setString(4,product.getColor());
            preparedStatement.setInt(5,product.getCategoryId());
            return preparedStatement.executeUpdate()>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE_BY_ID);
            callableStatement.setInt(1,id);
            return callableStatement.executeUpdate()>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean edit(int id, String name, BigDecimal price, int quantity, String color, int categoryId) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(EDIT_PRODUCT);
            callableStatement.setInt(1,id);
            callableStatement.setString(2,name);
            callableStatement.setBigDecimal(3,price);
            callableStatement.setInt(4,quantity);
            callableStatement.setString(5,color);
            callableStatement.setInt(6,categoryId);
            return callableStatement.executeUpdate()>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Product> findByName(String searchName) {
        List<Product> productList = new ArrayList<>();
        // kết nối db
        try (Connection connection = BaseRepository.getConnectDB()) {
            CallableStatement callableStatement = connection.prepareCall(FIND_BY_NAME);
            callableStatement.setString(1, searchName);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                BigDecimal price = resultSet.getBigDecimal("price");
                int quantity = resultSet.getInt("quantity");
                String color = resultSet.getString("color");
                int categoryId = resultSet.getInt("category_id");
                Product product = new Product(id,name,price,quantity,color,categoryId);
                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }


}
