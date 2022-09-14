package dev.kienntt.top_cv.repository;

import dev.kienntt.top_cv.entity.Token;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TokenRepository extends JpaRepository<Token, Long> {

    Token findByToken(String token);
}
