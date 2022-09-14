package dev.kienntt.top_cv.repository;

import dev.kienntt.top_cv.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
