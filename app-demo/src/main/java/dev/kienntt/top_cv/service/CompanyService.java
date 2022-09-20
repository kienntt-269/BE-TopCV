package dev.kienntt.top_cv.service;

import dev.kienntt.top_cv.entity.ProfileCompany;

import java.util.List;
import java.util.Optional;

public interface CompanyService {
    List<ProfileCompany> findAll();

    Optional<ProfileCompany> findById(Long id);

    ProfileCompany save(ProfileCompany job);

    void remove(Long id);

}
