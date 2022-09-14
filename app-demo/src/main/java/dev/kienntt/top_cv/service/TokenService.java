package dev.kienntt.top_cv.service;

import dev.kienntt.top_cv.entity.Token;

public interface TokenService {

    Token createToken(Token token);

    Token findByToken(String token);
}
