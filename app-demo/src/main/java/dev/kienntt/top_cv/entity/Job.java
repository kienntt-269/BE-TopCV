package dev.kienntt.top_cv.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "job_list")
@Getter
@Setter
public class Job extends BaseEntity{

    @Column(name = "basic_salary", length = 20)
    private String basicSalary;

    @Column(name = "recruit_number", length = 20)
    private Long recruitNumber;

    @Column(name = "sex", length = 30)
    private String sex;

    @Column(name = "age", length = 30)
    private String age;

    @Column(name = "english_ielts", length = 8)
    private Float englishIelts;

    @Column(name = "experience", length = 8)
    private Float experience;

    @Column(name = "other_requirement", length = 1000)
    private String otherRequirement;

    @Column(name = "job_description", length = 1000)
    private String jobDescription;

    @Column(name = "interests", length = 1000)
    private String interests;

    @Column(name = "company_id", length = 20)
    private String company_id;

    @Column(name = "submit_deadline", length = 6)
    private Date submitDeadline;

//    @ManyToMany(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
//    @JoinTable(name = "company", joinColumns = {@JoinColumn(name = "company_id")})
//    private Set<ProfileCompany> companys = new HashSet<>();

//    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
//    @JoinTable(name = "user_role", joinColumns = {@JoinColumn(name = "user_id")}, inverseJoinColumns = {@JoinColumn(name = "role_id")})
//    private Set<Career> careers = new HashSet<>();
}
