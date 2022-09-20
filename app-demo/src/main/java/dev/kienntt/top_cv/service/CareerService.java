package dev.kienntt.top_cv.service;

import dev.kienntt.top_cv.entity.Career;

import java.util.List;
import java.util.Optional;

public interface CareerService {
    List<Career> findAll();

    Optional<Career> findById(Long id);

    Career save(Career career);

    void remove(Long id);

}
