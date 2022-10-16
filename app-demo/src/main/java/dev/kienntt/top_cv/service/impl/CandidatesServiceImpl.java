package dev.kienntt.top_cv.service.impl;

import dev.kienntt.top_cv.entity.Candidates;
import dev.kienntt.top_cv.entity.Job;
import dev.kienntt.top_cv.repository.CandidatesRepository;
import dev.kienntt.top_cv.service.CandidatesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CandidatesServiceImpl implements CandidatesService {
    @Autowired
    private CandidatesRepository candidatesRepository;

    @Override
    public List<Candidates> findAll() {
        return candidatesRepository.findAll();
    }

    @Override
    public List<Candidates> findAllDuplicate(Long id) {
        List<Candidates> candidates = candidatesRepository.findAllDuplicate(id);
        return candidates;
    }

    @Override
    public Candidates save(Candidates candidates) {
        return candidatesRepository.save(candidates);
    }

    @Override
    public Optional<Candidates> findById(Long id) {
        return candidatesRepository.findById(id);
    }
}
