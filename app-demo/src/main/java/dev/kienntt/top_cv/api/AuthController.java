package dev.kienntt.top_cv.api;

import dev.kienntt.top_cv.entity.ProfileUser;
import dev.kienntt.top_cv.entity.ResponseObject;
import dev.kienntt.top_cv.entity.Token;
import dev.kienntt.top_cv.entity.User;
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
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

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
    public User register(@RequestBody User user) {
        user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));

        return userService.createUser(user);
    }

//    @PostMapping("/register")
//    ResponseEntity<ResponseObject> register(@RequestBody User user) {
//        user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));
//        return userService.createUser(user) ? ResponseEntity.status(HttpStatus.NOT_FOUND).body(
//                new ResponseObject(200, "Success", "Tạo tài khoản thành công")
//        ) : ResponseEntity.status(HttpStatus.OK).body(
//                new ResponseObject(400, "Fail", "Tạo tài khoản thất bại")
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

//    @PostMapping("/login")
//    public ResponseEntity<?> login(@RequestBody User user) {
//        UserPrincipal userPrincipal = userService.findByUsername(user.getUsername());
//        if (null == user || !new BCryptPasswordEncoder().matches(user.getPassword(), userPrincipal.getPassword())) {
//            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("tài khoản hoặc mật khẩu không chính xác");
//        }
//        Token token = new Token();
//        token.setToken(jwtUtil.generateToken(userPrincipal));
//        token.setTokenExpDate(jwtUtil.generateExpirationDate());
//        token.setCreatedBy(userPrincipal.getUserId());
//        tokenService.createToken(token);
//        return ResponseEntity.ok(token.getToken());
//    }

    @PostMapping("/updateProfileUserNotAvatar")
    ResponseEntity<ResponseObject> updateProfileUser(@RequestBody ProfileUser profileUser1) {
        ProfileUser profileUser = profileUserService.updateProfileUser(profileUser1);
        System.out.println(profileUser1);
        return ResponseEntity.status(HttpStatus.OK).body(
                new ResponseObject(200, "Success", profileUser)
        );
    }

    @PostMapping("/updateProfileUser")
    @ResponseStatus(HttpStatus.CREATED)
    public ProfileUser update(@RequestParam String height,
                       @RequestParam String weight, @RequestParam String workExperience, @RequestParam String education, @RequestParam String registerBook,
                       @RequestParam String cccd, @RequestParam String hobbies, @RequestParam String nativeLand, @RequestParam String genitive,
                       @RequestParam String cultureLevel, @RequestParam String wish, @RequestParam String career, @RequestParam String wage,
                       @RequestParam String area, @RequestParam String province, @RequestParam Long currentJobId, @RequestParam Long userId,
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
        return profileUserService.updateProfileUser(profileUser);
    }

    @GetMapping("/hello")
    @PreAuthorize("hasAnyAuthority('USER_READ')")
    public ResponseEntity hello() {
        return ResponseEntity.ok("hello");
    }
}
