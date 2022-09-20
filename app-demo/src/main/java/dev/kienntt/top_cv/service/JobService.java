package dev.kienntt.top_cv.service;

import dev.kienntt.top_cv.entity.Job;

import java.util.List;
import java.util.Optional;

public interface JobService {
    List<Job> findAll();

//    List<Job> searchJobs(String name);
    List<Job> searchJobsSQLDetail(String jobName, Float experience, Long profileCompanyId, Long careerId);

    List<Job> searchJobsSQLByName(String jobName);

    Optional<Job> findById(Long id);

    Job save(Job job);

    void remove(Long id);

}
