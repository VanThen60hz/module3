package repository;

import model.Customer;
import model.CustomerType;
import util.Page;
import util.Pageable;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerTypeRepository implements BaseRepository<CustomerType> {

    private static final String SELECT_ALL = "select * from loai_khach";

    @Override
    public List<CustomerType> findAll() {
        List<CustomerType> result = new ArrayList<>();

        try(PreparedStatement st = Config.getConnection().prepareStatement(SELECT_ALL)){
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                int id = rs.getInt("ma_loai_khach");
                String name = rs.getString("ten_loai_khach");
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    @Override
    public Page<CustomerType> findAll(Pageable pageable) {
        return null;
    }

    @Override
    public int save(CustomerType customerType) {
        return 0;
    }

    @Override
    public List<CustomerType> find(String q) {
        return null;
    }

    @Override
    public int delete(int id) {
        return 0;
    }
}
