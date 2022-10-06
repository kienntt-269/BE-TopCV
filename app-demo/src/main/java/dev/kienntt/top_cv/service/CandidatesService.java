package dev.kienntt.top_cv.service;

import dev.kienntt.top_cv.entity.Candidates;
import dev.kienntt.top_cv.entity.Career;

import java.util.List;

public interface CandidatesService {
    List<Candidates> findAll();

    Candidates save(Candidates candidates);
}
