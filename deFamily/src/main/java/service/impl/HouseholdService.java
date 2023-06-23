package service.impl;

import model.Household;
import repository.IHouseholdRepository;
import repository.impl.HouseholdRepository;
import service.IHouseholdService;

import java.util.List;

public class HouseholdService implements IHouseholdService {
    private IHouseholdRepository householdRepository = new HouseholdRepository();
    @Override
    public List<Household> findAll() {
        return householdRepository.findAll();
    }
}
