package dev.kienntt.top_cv.repository;

import dev.kienntt.top_cv.entity.Candidates;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CandidatesRepository extends JpaRepository<Candidates, Long> {
}
