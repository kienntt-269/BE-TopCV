package dev.kienntt.top_cv.api;

import dev.kienntt.top_cv.entity.*;
import dev.kienntt.top_cv.security.JwtUtil;
import dev.kienntt.top_cv.security.UserPrincipal;
import dev.kienntt.top_cv.service.ProfileUserService;
import dev.kienntt.top_cv.service.TokenService;
import dev.kienntt.top_cv.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping(path = "/api/v1/user")
public class AuthController {
    private static final Path CURRENT_FOLDER = Paths.get(System.getProperty("user.dir"));

    @Autowired
    private UserService userService;

    @Autowired
    private TokenService tokenService;

    @Autowired
    private JwtUtil jwtUtil;

    @Autowired
    private ProfileUserService profileUserService;

    @PostMapping("/register")
    public ResponseEntity<ResponseObject> register(@RequestBody User user) {
        final String uri = "https://cvnl.me/uuid/v1/user/create";

        Account account = new Account();
        account.setAccount(user.getUsername());
        account.setHash(user.getPassword());

        RestTemplate restTemplate = new RestTemplate();
        String result = restTemplate.postForObject(uri, account, String.class);

        if (result.contains("success")) {
            user.setUuid(result.substring(62, 86));
            System.out.println(result);
        } else if (result.contains("UserExisted")) {
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponseObject(201, "Failed", "Tài khoản đã tồn tại")
            );
        }
        user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));

        return ResponseEntity.status(HttpStatus.OK).body(
                new ResponseObject(200, "Success", userService.createUser(user))
        );
    }

//    @PostMapping("/updatePassword")
//    public ResponseEntity<ResponseObject> updatePassword(@RequestBody Password password) {
//        final String uri = "https://cvnl.me/uuid/v1/user/create";
//
//        Account account = new Account();
//        account.setAccount(user.getUsername());
//        account.setHash(user.getPassword());
//
//        RestTemplate restTemplate = new RestTemplate();
//        String result = restTemplate.postForObject(uri, account, String.class);
//
//        if (result.contains("success")) {
//            user.setUuid(result.substring(62, 86));
//            System.out.println(result);
//        } else if (result.contains("UserExisted")) {
//            return ResponseEntity.status(HttpStatus.OK).body(
//                    new ResponseObject(201, "Failed", "Tài khoản đã tồn tại")
//            );
//        }
//
//        return ResponseEntity.status(HttpStatus.OK).body(
//                new ResponseObject(200, "Success", userService.createUser(user))
//        );
//    }

    @PostMapping("/login")
    public ResponseEntity<ResponseObject> login(@RequestBody User user) {
        UserPrincipal userPrincipal = userService.findByUsername(user.getUsername());
        if (null == user || !new BCryptPasswordEncoder().matches(user.getPassword(), userPrincipal.getPassword())) {
            return ResponseEntity.status(HttpStatus.OK).body(
                new ResponseObject(201, "Fail", "Tài khoản hoặc mật khẩu không đúng")
        );
        }
        Token token = new Token();
        token.setToken(jwtUtil.generateToken(userPrincipal));
        token.setTokenExpDate(jwtUtil.generateExpirationDate());
        token.setCreatedBy(userPrincipal.getUserId());
        tokenService.createToken(token);
//        ResponseEntity.ok(token.getToken())
        return ResponseEntity.status(HttpStatus.OK).body(
                new ResponseObject(200, "Success", jwtUtil.getUserByToken(token.getToken()))
        );
    }

    @PostMapping("/updateProfileUserNotAvatar")
    ResponseEntity<ResponseObject> updateProfileUser(@RequestBody ProfileUser profileUser1) {
        ProfileUser profileUser = profileUserService.updateProfileUser(profileUser1);
        System.out.println(profileUser1);
        return ResponseEntity.status(HttpStatus.OK).body(
                new ResponseObject(200, "Success", profileUser)
        );
    }

    @PostMapping("/updateProfileUser")
//    @ResponseStatus(HttpStatus.CREATED)
    public ProfileUser update(@RequestParam(value = "id", required=false) Long id, @RequestParam Long userId, @RequestParam String height,
                       @RequestParam String weight, @RequestParam String workExperience, @RequestParam String education, @RequestParam String registerBook,
                       @RequestParam String cccd, @RequestParam String hobbies, @RequestParam String nativeLand, @RequestParam String genitive,
                       @RequestParam String cultureLevel, @RequestParam String wish, @RequestParam String career, @RequestParam String wage,
                       @RequestParam String area, @RequestParam String province, @RequestParam Long currentJobId,
                       @RequestParam MultipartFile image) throws IOException {
        Path staticPath = Paths.get("static");
        Path imagePath = Paths.get("images");
        if (!Files.exists(CURRENT_FOLDER.resolve(staticPath).resolve(imagePath))) {
            Files.createDirectories(CURRENT_FOLDER.resolve(staticPath).resolve(imagePath));
        }
        Path file = CURRENT_FOLDER.resolve(staticPath)
                .resolve(imagePath).resolve(image.getOriginalFilename());
        try (OutputStream os = Files.newOutputStream(file)) {
            os.write(image.getBytes());
        }

        ProfileUser profileUser = new ProfileUser();
        if (id != null) {
            profileUser.setId(id);
        }
        profileUser.setHeight(height);
        profileUser.setWeight(weight);
        profileUser.setWorkExperience(workExperience);
        profileUser.setEducation(education);
        profileUser.setRegisterBook(registerBook);
        profileUser.setCccd(cccd);
        profileUser.setHobbies(hobbies);
        profileUser.setNativeLand(nativeLand);
        profileUser.setGenitive(genitive);
        profileUser.setCultureLevel(cultureLevel);
        profileUser.setWish(wish);
        profileUser.setCareer(career);
        profileUser.setWage(wage);
        profileUser.setArea(area);
        profileUser.setProvince(province);
        profileUser.setCurrentJobId(currentJobId);
        profileUser.setUserId(userId);
        profileUser.setAvatar(imagePath.resolve(image.getOriginalFilename()).toString());
        return profileUserService.save(profileUser);
    }

    @GetMapping("/getProfileUser/{id}")
    public ResponseEntity<ResponseObject> getProfileUser(@PathVariable Long id) {
        List<ProfileUser> foundProfileUser = profileUserService.findByUserId(id);;
        return ResponseEntity.status(HttpStatus.OK).body(
                new ResponseObject(200, "Success", foundProfileUser)
        );
    }
//    @GetMapping("/hello")
//    @PreAuthorize("hasAnyAuthority('USER_READ')")
//    public ResponseEntity hello() {
//        return ResponseEntity.ok("hello");
//    }
}
