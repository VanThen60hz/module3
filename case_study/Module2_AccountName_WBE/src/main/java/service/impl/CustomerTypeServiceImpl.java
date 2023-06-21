package service.impl;

import model.CustomerType;
import repository.CustomerTypeRepository;
import service.CustomerTypeService;

import java.util.List;

public class CustomerTypeServiceImpl implements CustomerTypeService {
    private CustomerTypeRepository customerTypeRepository = new CustomerTypeRepository();
    @Override
    public List<CustomerType> findAll() {
        return customerTypeRepository.findAll();
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
