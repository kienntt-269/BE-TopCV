package dev.kienntt.top_cv.service.impl;

import dev.kienntt.top_cv.entity.ProfileCompany;
import dev.kienntt.top_cv.repository.CompanyRepository;
import dev.kienntt.top_cv.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CompanyServiceImpl implements CompanyService {
    @Autowired
    private CompanyRepository companyRepository;

    @Override
    public List<ProfileCompany> findAll() {
        return companyRepository.findAll();
    }

    @Override
    public Optional<ProfileCompany> findById(Long id) {
        return companyRepository.findById(id);
    }

    @Override
    public ProfileCompany save(ProfileCompany profileCompany) {
        return companyRepository.save(profileCompany);
    }

    @Override
    public void remove(Long id) {
        companyRepository.deleteById(id);
    }
}
