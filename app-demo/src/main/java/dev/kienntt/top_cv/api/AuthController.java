package dev.kienntt.top_cv.api;

import dev.kienntt.top_cv.entity.ResponseObject;
import dev.kienntt.top_cv.entity.Token;
import dev.kienntt.top_cv.entity.User;
import dev.kienntt.top_cv.security.JwtUtil;
import dev.kienntt.top_cv.security.UserPrincipal;
import dev.kienntt.top_cv.service.TokenService;
import dev.kienntt.top_cv.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(path = "/api/v1/user")
public class AuthController {

    @Autowired
    private UserService userService;

    @Autowired
    private TokenService tokenService;

    @Autowired
    private JwtUtil jwtUtil;

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

    @GetMapping("/hello")
    @PreAuthorize("hasAnyAuthority('USER_READ')")
    public ResponseEntity hello() {
        return ResponseEntity.ok("hello");
    }
}
