package dev.kienntt.top_cv.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "profile_company")
public class ProfileCompany extends BaseEntity {

    @Column(name = "introduction", length = 1000)
    private String introduction;

    @Column(name = "staff_number", length = 20)
    private Long staffNumber;

    @Column(name = "contact_info", length = 255)
    private String contactInfo;

    @Column(name = "current_address", length = 255)
    private String currentAddress;

    @Column(name = "website", length = 255)
    private String website;

    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
    @JoinTable(name = "job_list", joinColumns = {@JoinColumn(name = "company_id")})
    private Job job;
}
