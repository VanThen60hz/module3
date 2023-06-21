package service.impl;

import model.Customer;
import repository.CustomerRepository;
import service.CustomerService;
import util.Page;
import util.Pageable;

import java.util.List;

public class CustomerServiceImpl implements CustomerService {

    private CustomerRepository customerRepository = new CustomerRepository();

    @Override
    public List<Customer> findAll() {
        return customerRepository.findAll();
    }

    @Override
    public int save(Customer customer) {
        return customerRepository.save(customer);
    }

    @Override
    public List<Customer> find(String q) {
        return customerRepository.find(q);
    }

    @Override
    public int delete(int id) {
        return customerRepository.delete(id);
    }

    @Override
    public Page<Customer> findAll(Pageable pageable) {
        return customerRepository.findAll(pageable);
    }
}
