package dev.kienntt.top_cv.service;

import dev.kienntt.top_cv.entity.User;
import dev.kienntt.top_cv.security.UserPrincipal;

public interface UserService {
    User createUser(User user);
    UserPrincipal findByUsername(String username);
}
