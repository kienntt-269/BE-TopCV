package dev.kienntt.top_cv.service;

import dev.kienntt.top_cv.entity.Job;

import java.util.List;
import java.util.Optional;

public interface JobService {
    List<Job> findAll();

    Optional<Job> findById(Long id);

    Job save(Job job);

    void remove(Long id);

}
