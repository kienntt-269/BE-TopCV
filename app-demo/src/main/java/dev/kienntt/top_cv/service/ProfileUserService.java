package dev.kienntt.top_cv.service;

import dev.kienntt.top_cv.entity.Job;
import dev.kienntt.top_cv.entity.ProfileUser;
import dev.kienntt.top_cv.entity.User;

import java.util.Optional;

public interface ProfileUserService {
//    ProfileUser updateProfileUserSQL(Long id, String height, String weight);

    ProfileUser updateProfileUser(ProfileUser profileUser);

    Optional<ProfileUser> findById(Long id);

    ProfileUser save(ProfileUser profileUser);
}
