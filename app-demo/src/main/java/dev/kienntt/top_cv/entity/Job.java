package dev.kienntt.top_cv.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "job_list")
@Getter
@Setter
//@SecondaryTable(name = "career_list", pkJoinColumns = @PrimaryKeyJoinColumn(name = "id"))
public class Job extends BaseEntity{
    @Column(name = "name", length = 255)
    private String name;

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

    @Column(name = "submit_deadline", length = 6)
    private Date submitDeadline;

    @Column(name = "company_id", length = 6)
    private Long profileCompanyId;

    @Column(name = "career_list_id", length = 6)
    private Long careerId;

    @Column(name = "job_type", length = 6)
    private Long jobType;

    @ManyToOne
    @JoinColumn(name = "company_id", insertable = false, updatable = false) // thông qua khóa ngoại company_id
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private ProfileCompany profileCompany;

    @ManyToOne
    @JoinColumn(name = "career_list_id", nullable = true, insertable = false, updatable = false) // thông qua khóa ngoại career_list_id
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private Career career;
}
