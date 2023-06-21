package service;

import model.Customer;
import util.Page;
import util.Pageable;

public interface CustomerService extends BaseService<Customer>{
    Page<Customer> findAll(Pageable pageable);
}
