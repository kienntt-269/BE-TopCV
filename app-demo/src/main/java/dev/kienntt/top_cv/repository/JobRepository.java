package dev.kienntt.top_cv.repository;

import dev.kienntt.top_cv.entity.Job;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface JobRepository extends JpaRepository<Job, Long> {
    @Query("SELECT j FROM Job j WHERE " +
            ":jobName is null or j.name LIKE CONCAT('%',:jobName, '%')" +
                "and (:experience is null or j.experience = :experience)" +
                    " and (:profileCompanyId is null or j.profileCompany.id = :profileCompanyId)" +
                        " and (:basicSalary is null or j.basicSalary = :basicSalary)" +
                            " and (:sex is null or j.sex = :sex)" +
                                " and (:careerId is null or j.career.id = :careerId)")
    List<Job> searchJobsSQLDetail(String jobName, Float experience, Long profileCompanyId, Long careerId, String basicSalary, String sex);
//    List<Job> searchJobsSQL(String query);

    @Query("SELECT j FROM Job j WHERE " +
            ":jobName is null or j.name LIKE CONCAT('%',:jobName, '%')")
    List<Job> searchJobsSQLByName(String jobName);

    @Query("SELECT j FROM Job j WHERE " +
            ":careerId is null or j.careerId = :careerId")
    List<Job> searchJobsSQLByCareer(Long careerId);
}
