package dev.kienntt.top_cv.service;

import dev.kienntt.top_cv.entity.Candidates;
import dev.kienntt.top_cv.entity.Career;

import java.util.List;
import java.util.Optional;

public interface CandidatesService {
    List<Candidates> findAll();

    List<Candidates> findAllDuplicate(Long id);

    Candidates save(Candidates candidates);

    Optional<Candidates> findById(Long id);
}
