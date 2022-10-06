package dev.kienntt.top_cv.repository;

import dev.kienntt.top_cv.entity.Job;
import dev.kienntt.top_cv.entity.ProfileUser;
import dev.kienntt.top_cv.security.UserPrincipal;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;
import java.util.List;

public interface ProfileUserRepository extends JpaRepository<ProfileUser, Long> {

    @Query("SELECT u FROM ProfileUser u WHERE " +
            ":id is null or u.user.id = :id")
    ProfileUser updateProfileUser(Long id);

//    @Transactional
//    @Modifying
//    @Query(value = "UPDATE ProfileUser u set u.height =:height where u.weight = :weight",
//            nativeQuery = true)
//    ProfileUser updateProfileUserSQL(Long id, String height, String weight);
//    void updateUser(@Param("emailVerificationStatus") boolean emailVerificationStatus, @Param("userId") String userId);

    @Override
    <S extends ProfileUser> S saveAndFlush(S s);
}
