package dev.kienntt.top_cv.api;

import dev.kienntt.top_cv.entity.Career;
import dev.kienntt.top_cv.entity.Job;
import dev.kienntt.top_cv.entity.ProfileCompany;
import dev.kienntt.top_cv.entity.ResponseObject;
import dev.kienntt.top_cv.service.CareerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin("*")
@RequestMapping("/api/v1/career")
public class CareerController {

    @Autowired
    private CareerService careerService;

    @PostMapping("/createCareer")
    public ResponseEntity<Career> createNewJob(@RequestBody Career career) {
        return new ResponseEntity<>(careerService.save(career), HttpStatus.OK);
    }

    @GetMapping("/getAllCareer")
//    @PreAuthorize("hasAnyAuthority('USER_READ')")
    ResponseEntity<ResponseObject> getAllCareer() {
        List<Career> foundCareer = careerService.findAll();
        return foundCareer.isEmpty() ? ResponseEntity.status(HttpStatus.NOT_FOUND).body(
                new ResponseObject(400, "Fail", "")
        ) : ResponseEntity.status(HttpStatus.OK).body(
                new ResponseObject(200, "Success", foundCareer)
        );
    }
}
