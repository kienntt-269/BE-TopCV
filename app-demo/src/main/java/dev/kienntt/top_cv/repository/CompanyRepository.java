package dev.kienntt.top_cv.repository;

import dev.kienntt.top_cv.entity.ProfileCompany;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CompanyRepository extends JpaRepository<ProfileCompany, Long> {
}
