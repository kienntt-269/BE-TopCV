package dev.kienntt.top_cv.service.impl;

import dev.kienntt.top_cv.entity.Token;
import dev.kienntt.top_cv.repository.TokenRepository;
import dev.kienntt.top_cv.service.TokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TokenServiceImpl implements TokenService {

    @Autowired
    private TokenRepository tokenRepository;

    public Token createToken(Token token) {
        return tokenRepository.saveAndFlush(token);
    }

    @Override
    public Token findByToken(String token) {
        return tokenRepository.findByToken(token);
    }
}
