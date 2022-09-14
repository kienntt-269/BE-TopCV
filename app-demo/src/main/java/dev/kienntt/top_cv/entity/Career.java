package dev.kienntt.top_cv.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.SecondaryTable;
import javax.persistence.Table;

@Entity
@Table(name = "careed_list")
@Getter
@Setter
@SecondaryTable(name = "job_list", pkJoinColumns = @PrimaryKeyJoinColumn(name = "career_list_id"))
public class Career extends BaseEntity{
    private String name;
}
