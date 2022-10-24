package dev.kienntt.top_cv.service;

import dev.kienntt.top_cv.entity.ProfileUser;

import java.util.List;
import java.util.Optional;

public interface ProfileUserService {
//    ProfileUser updateProfileUserSQL(Long id, String height, String weight);

    ProfileUser updateProfileUser(ProfileUser profileUser);

    Optional<ProfileUser> findById(Long id);

    List<ProfileUser> findByUserId(Long id);

    ProfileUser save(ProfileUser profileUser);
}
