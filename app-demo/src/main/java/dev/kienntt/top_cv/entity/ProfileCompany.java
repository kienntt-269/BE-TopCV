package dev.kienntt.top_cv.entity;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.*;

import javax.persistence.*;
import java.util.Collection;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "profile_company")
public class ProfileCompany extends BaseEntity {

    @Column(name = "name", length = 255)
    private String name;

    @Column(name = "name_asc", length = 255)
    private String nameAsc;

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

//    @OneToMany(fetch=FetchType.EAGER, mappedBy = "profileCompany", cascade = CascadeType.REMOVE)
//    @EqualsAndHashCode.Exclude // không sử dụng trường này trong equals và hashcode
//    @ToString.Exclude // Khoonhg sử dụng trong toString()
//    @JsonManagedReference
//    private Collection<Job> jobs;
}
