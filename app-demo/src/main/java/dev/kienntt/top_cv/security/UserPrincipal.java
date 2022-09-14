package dev.kienntt.top_cv.security;

import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;

@Getter
@Setter
public class UserPrincipal implements UserDetails {
    private Long userId;
    private String username;
    private String password;
    private String token;
    private String height;
    private String weight;
    private String experience;
    private String highSchool;
    private String registerBook;
    private String cccd;
    private String hobbies;
    private String nativeLand;
    private String genitive;
    private String cultureLevel;
    private String wish;
    private String career;
    private String specialCondition;
    private String wage;
    private String area;
    private String province;
    private String currentJobId;
    private Collection authorities;

    @Override
    public boolean isAccountNonExpired() {
        return false;
    }

    @Override
    public boolean isAccountNonLocked() {
        return false;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return false;
    }

    @Override
    public boolean isEnabled() {
        return false;
    }
}
