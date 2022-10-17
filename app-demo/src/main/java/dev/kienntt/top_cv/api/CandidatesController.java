package dev.kienntt.top_cv.api;

import dev.kienntt.top_cv.entity.Candidates;
import dev.kienntt.top_cv.entity.Career;
import dev.kienntt.top_cv.entity.Job;
import dev.kienntt.top_cv.entity.ResponseObject;
import dev.kienntt.top_cv.service.CandidatesService;
import dev.kienntt.top_cv.service.CareerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping(path = "/api/v1/candidates")
public class CandidatesController {
    @Autowired
    private CandidatesService candidatesService;

    @PostMapping("/createCandidates")
    public ResponseEntity<Candidates> createCandidates(@RequestBody Candidates candidates) {
        System.out.println(candidates);
        System.out.println(candidates.getId());
        if(candidates.getId() != null) {
            candidates.setId(candidates.getId());
        }
        return new ResponseEntity<>(candidatesService.save(candidates), HttpStatus.OK);
    }

//    @GetMapping("/getAllCandidates")
//    ResponseEntity<ResponseObject> getAllCandidates() {
//        List<Candidates> foundCandidates = candidatesService.findAllDuplicate();
//        return foundCandidates.isEmpty() ? ResponseEntity.status(HttpStatus.NOT_FOUND).body(
//                new ResponseObject(400, "Fail", "")
//        ) : ResponseEntity.status(HttpStatus.OK).body(
//                new ResponseObject(200, "Success", foundCandidates)
//        );
//    }

    @GetMapping("/getCandidateByUser/{id}")
//    @PreAuthorize("hasAnyAuthority('USER_READ')")
    ResponseEntity<ResponseObject> getCandidate(@PathVariable Long id) {
        List<Candidates> foundCandidates = candidatesService.findAllDuplicate(id);
        return ResponseEntity.status(HttpStatus.OK).body(
                new ResponseObject(200, "Success", foundCandidates)
        );
    }
}
