package dev.kienntt.top_cv.repository;

import dev.kienntt.top_cv.entity.Candidates;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CandidatesRepository extends JpaRepository<Candidates, Long> {
    @Query("SELECT c FROM Candidates c WHERE " +
            "c.profileUserId = :profileUserId")
    List<Candidates> findAllDuplicate(Long profileUserId);
}
