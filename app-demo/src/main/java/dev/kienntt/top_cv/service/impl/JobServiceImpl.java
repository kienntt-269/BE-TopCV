package dev.kienntt.top_cv.service.impl;

import dev.kienntt.top_cv.entity.Job;
import dev.kienntt.top_cv.repository.JobRepository;
import dev.kienntt.top_cv.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class JobServiceImpl implements JobService {
    @Autowired
    private JobRepository jobRepository;

    @Override
    public List<Job> findAll() {
        return jobRepository.findAll();
    }

    @Override
    public List<Job> searchJobsSQLDetail(String jobName, Float experience, Long profileCompanyId, Long careerId) {
        List<Job> jobs = jobRepository.searchJobsSQLDetail(jobName, experience, profileCompanyId, careerId);
        return jobs;
    }

    @Override
    public List<Job> searchJobsSQLByName(String jobName) {
        List<Job> jobs = jobRepository.searchJobsSQLByName(jobName);
        return jobs;
    }

    @Override
    public Optional<Job> findById(Long id) {
        return jobRepository.findById(id);
    }

    @Override
    public Job save(Job job) {
        return jobRepository.save(job);
    }

    @Override
    public void remove(Long id) {
        jobRepository.deleteById(id);
    }

}
