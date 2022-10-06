package dev.kienntt.top_cv.api;

import dev.kienntt.top_cv.entity.Candidates;
import dev.kienntt.top_cv.entity.Career;
import dev.kienntt.top_cv.entity.ResponseObject;
import dev.kienntt.top_cv.service.CandidatesService;
import dev.kienntt.top_cv.service.CareerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "/api/v1/candidates")
public class CandidatesController {
    @Autowired
    private CandidatesService candidatesService;

    @PostMapping("/createCandidates")
    public ResponseEntity<Candidates> createCandidates(@RequestBody Candidates candidates) {
        return new ResponseEntity<>(candidatesService.save(candidates), HttpStatus.OK);
    }

    @GetMapping("/getAllCandidates")
//    @PreAuthorize("hasAnyAuthority('USER_READ')")
    ResponseEntity<ResponseObject> getAllCandidates() {
        List<Candidates> foundCandidates = candidatesService.findAll();
        return foundCandidates.isEmpty() ? ResponseEntity.status(HttpStatus.NOT_FOUND).body(
                new ResponseObject(400, "Fail", "")
        ) : ResponseEntity.status(HttpStatus.OK).body(
                new ResponseObject(200, "Success", foundCandidates)
        );
    }
}
