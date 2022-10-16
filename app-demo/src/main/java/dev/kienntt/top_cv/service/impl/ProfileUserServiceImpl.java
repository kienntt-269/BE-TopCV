package dev.kienntt.top_cv.service.impl;

import dev.kienntt.top_cv.entity.ProfileUser;
import dev.kienntt.top_cv.repository.ProfileUserRepository;
import dev.kienntt.top_cv.service.ProfileUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class ProfileUserServiceImpl implements ProfileUserService {

    @Autowired
    private ProfileUserRepository profileUserRepository;
//    @Override
//    public ProfileUser updateProfileUserSQL(Long id, String height, String weight) {
//        ProfileUser profileUser = profileUserRepository.updateProfileUserSQL(id, height, weight);
//        return profileUser;
//    }


    @Override
    public ProfileUser save(ProfileUser profileUser) {
        return profileUserRepository.save(profileUser);
    }

    @Override
    public ProfileUser updateProfileUser(ProfileUser profileUser) {
        return profileUserRepository.save(profileUser);
    }

    @Override
    public Optional<ProfileUser> findById(Long id) {
        return profileUserRepository.findById(id);
    }
}
