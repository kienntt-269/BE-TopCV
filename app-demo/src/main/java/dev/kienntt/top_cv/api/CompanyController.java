package dev.kienntt.top_cv.api;

import dev.kienntt.top_cv.entity.Job;
import dev.kienntt.top_cv.entity.ProfileCompany;
import dev.kienntt.top_cv.entity.ResponseObject;
import dev.kienntt.top_cv.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin("*")
@RequestMapping("/api/v1/company")
public class CompanyController {
    @Autowired
    private CompanyService companyService;

    @PostMapping("/createCompany")
    public ResponseEntity<ProfileCompany> createNewJob(@RequestBody ProfileCompany profileCompany) {
        return new ResponseEntity<>(companyService.save(profileCompany), HttpStatus.OK);
    }

    @GetMapping("/getAllCompany")
//    @PreAuthorize("hasAnyAuthority('USER_READ')")
    ResponseEntity<ResponseObject> getAllCompany() {
        List<ProfileCompany> foundCompany = companyService.findAll();
        return foundCompany.isEmpty() ? ResponseEntity.status(HttpStatus.NOT_FOUND).body(
                new ResponseObject(400, "Fail", "")
        ) : ResponseEntity.status(HttpStatus.OK).body(
                new ResponseObject(200, "Success", foundCompany)
        );
    }
}
