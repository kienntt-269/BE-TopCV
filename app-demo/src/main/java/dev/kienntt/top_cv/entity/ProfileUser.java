package dev.kienntt.top_cv.entity;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.io.File;

@Entity
@Table(name = "profile_user")
@Getter
@Setter
public class ProfileUser extends BaseEntity{
    @Column(name = "avatar", length = 255)
    private String avatar;

    @Column(name = "height", length = 255)
    private String height;

    @Column(name = "weight", length = 255)
    private String weight;

    @Column(name = "work_experience", length = 255)
    private String workExperience;

    @Column(name = "education", length = 255)
    private String education;

    @Column(name = "register_book", length = 255)
    private String registerBook;

    @Column(name = "cccd", length = 255)
    private String cccd;

    @Column(name = "hobbies", length = 255)
    private String hobbies;

    @Column(name = "native_land", length = 255)
    private String nativeLand;

    @Column(name = "genitive", length = 255)
    private String genitive;

    @Column(name = "culture_level", length = 255)
    private String cultureLevel;

    @Column(name = "wish", length = 255)
    private String wish;

    @Column(name = "career", length = 255)
    private String career;

    @Column(name = "wage", length = 255)
    private String wage;

    @Column(name = "area", length = 255)
    private String area;

    @Column(name = "province", length = 255)
    private String province;

    @Column(name = "user_id", length = 20)
    private Long userId;

    @Column(name = "current_job_id", length = 20)
    private Long currentJobId;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "user_id", nullable = true, insertable = false, updatable = false) // thông qua khóa ngoại user_id
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private User user;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "current_job_id", nullable = true, insertable = false, updatable = false) // thông qua khóa ngoại current_job_id
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private Job job;
}
