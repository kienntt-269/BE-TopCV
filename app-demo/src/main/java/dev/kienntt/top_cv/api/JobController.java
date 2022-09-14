package dev.kienntt.top_cv.api;

import dev.kienntt.top_cv.entity.Job;
import dev.kienntt.top_cv.entity.ResponseObject;
import dev.kienntt.top_cv.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@CrossOrigin("*")
@RequestMapping("/api/v1/job")
public class JobController {
    @Autowired
    private JobService jobService;

    @PostMapping("/createJob")
    public ResponseEntity<Job> createNewJob(@RequestBody Job job) {
        return new ResponseEntity<>(jobService.save(job), HttpStatus.OK);
    }

    @GetMapping("/getAllJob")
//    @PreAuthorize("hasAnyAuthority('USER_READ')")
    ResponseEntity<ResponseObject> getAllJob() {
        List<Job> foundJob = jobService.findAll();
        return foundJob.isEmpty() ? ResponseEntity.status(HttpStatus.NOT_FOUND).body(
                new ResponseObject(400, "Fail", "")
        ) : ResponseEntity.status(HttpStatus.OK).body(
                new ResponseObject(200, "Success", foundJob)
        );
    }

    @GetMapping("/showJob/{id}")
//    @PreAuthorize("hasAnyAuthority('USER_READ')")
    public ResponseEntity<Job> showJob(@PathVariable Long id) {
        Optional<Job> jobOptional = jobService.findById(id);
        return jobOptional.map(job -> new ResponseEntity<>(job, HttpStatus.OK))
                .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

}