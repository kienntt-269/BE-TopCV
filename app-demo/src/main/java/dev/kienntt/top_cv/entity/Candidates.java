package dev.kienntt.top_cv.entity;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;

@Entity
@Table(name = "candidates_list")
@Getter
@Setter
public class Candidates {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "job_id", nullable = false)
    private Long jobId;

    @Column(name = "user_id", nullable = false)
    private Long profileUserId;

    @Column(name = "candidates_type", nullable = false)
    private Long candidatesType;

    @ManyToOne
    @JoinColumn(name = "job_id", nullable = true, insertable = false, updatable = false)
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private Job job;

//    @ManyToOne
//    @JoinColumn(name = "user_id", nullable = true, insertable = false, updatable = false)
//    @EqualsAndHashCode.Exclude
//    @ToString.Exclude
//    private ProfileUser profileUser;
}
