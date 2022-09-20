package dev.kienntt.top_cv.service.impl;

import dev.kienntt.top_cv.entity.Career;
import dev.kienntt.top_cv.repository.CareerRepository;
import dev.kienntt.top_cv.service.CareerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CareerServiceImpl implements CareerService {

    @Autowired
    private CareerRepository careerRepository;

    @Override
    public List<Career> findAll() {
        return careerRepository.findAll();
    }

    @Override
    public Optional<Career> findById(Long id) {
        return Optional.empty();
    }

    @Override
    public Career save(Career career) {
        return careerRepository.save(career);
    }

    @Override
    public void remove(Long id) {

    }
}
