package dev.kienntt.top_cv.entity;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "career_list")
@Getter
@Setter
public class Career extends BaseEntity{
    private String name;

//    @OneToMany(fetch=FetchType.EAGER, mappedBy = "career", cascade = CascadeType.REMOVE)
//    @EqualsAndHashCode.Exclude // không sử dụng trường này trong equals và hashcode
//    @ToString.Exclude // Khoonhg sử dụng trong toString()
//    @JsonManagedReference
//    private Collection<Job> jobs;

}
