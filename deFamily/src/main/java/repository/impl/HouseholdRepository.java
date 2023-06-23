package repository.impl;

import model.Household;
import repository.BaseRepository;
import repository.IHouseholdRepository;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class HouseholdRepository implements IHouseholdRepository {
    private final String SELECT_ALL ="select * from household;";
    @Override
    public List<Household> findAll() {
        List<Household> householdList = new ArrayList<>();
        // kết nối db
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                String id = resultSet.getString("id");
                String name = resultSet.getString("name");
                int quantity = resultSet.getInt("quantity");
                String dateOfRegistration = resultSet.getString("dateOfRegistration");
                String address = resultSet.getString("address");
                Household household = new Household(id,name,quantity,dateOfRegistration,address);
                householdList.add(household);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return householdList;
    }
}
