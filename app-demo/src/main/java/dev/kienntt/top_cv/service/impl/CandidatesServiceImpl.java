package dev.kienntt.top_cv.service.impl;

import dev.kienntt.top_cv.entity.Candidates;
import dev.kienntt.top_cv.repository.CandidatesRepository;
import dev.kienntt.top_cv.service.CandidatesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CandidatesServiceImpl implements CandidatesService {
    @Autowired
    private CandidatesRepository candidatesRepository;

    @Override
    public List<Candidates> findAll() {
        return candidatesRepository.findAll();
    }

    @Override
    public Candidates save(Candidates candidates) {
        return candidatesRepository.save(candidates);
    }
}
