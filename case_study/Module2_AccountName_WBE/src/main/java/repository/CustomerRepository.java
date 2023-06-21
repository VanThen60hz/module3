package repository;

import model.Customer;
import model.CustomerType;
import util.Page;
import util.PageHelper;
import util.Pageable;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CustomerRepository implements BaseRepository<Customer> {

    private final String FIND_ALL = "select * from khach_hang kh join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach order by kh.ma_khach_hang";
    private final String FIND_ALL_PAGING = "select * from khach_hang kh join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach order by kh.ma_khach_hang limit ?lim offset ?off";

    @Override
    public List<Customer> findAll() {

        return findAll(FIND_ALL);
    }

    @Override
    public Page<Customer> findAll(Pageable pageable) {
        return null;
    }


    private List<Customer> findAll(String query) {
        List<Customer> result = new ArrayList<>();
        try (Connection connection = Config.getConnection();
             PreparedStatement st = connection.prepareStatement(query)) {
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                result.add(getCustomer(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    private Customer getCustomer(ResultSet rs) throws SQLException {
        int id = rs.getInt(1);
        String fullName = rs.getString(2);
        Date dateBirthday = rs.getDate(3);
        LocalDate birthday = new java.sql.Date(dateBirthday.getTime()).toLocalDate();
        Boolean gender = rs.getBoolean(4);
        String identifyNumber = rs.getString(5);
        String phone = rs.getString(6);
        String email = rs.getString(7);
        String address = rs.getString(8);
        int customerTypeId = rs.getInt(9);
        String customerTypeName = rs.getString(11);

        CustomerType customerType = new CustomerType(customerTypeId, customerTypeName);
        Customer customer = new Customer(id, fullName, birthday, gender, identifyNumber, phone, email, address, customerTypeId, customerType);
        return customer;
    }

    @Override
    public int save(Customer customer) {
        return 0;
    }

    @Override
    public List<Customer> find(String q) {
        return null;
    }

    @Override
    public int delete(int id) {
        return 0;
    }
}
