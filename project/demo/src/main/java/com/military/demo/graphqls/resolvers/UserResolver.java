package com.military.demo.graphqls.resolvers;

import com.military.demo.models.User;
import com.military.demo.services.UserService;

import org.springframework.stereotype.Component;

import graphql.kickstart.tools.GraphQLMutationResolver;
import graphql.kickstart.tools.GraphQLQueryResolver;
import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class UserResolver implements GraphQLQueryResolver, GraphQLMutationResolver {
    
    private final UserService userService;

    public User userFindByEmail(String email) {
        return userService.findByEmail(email).orElse(null);
    }

    public User addUser(User user) {
        if (userService.findByEmail(user.getEmail()).isPresent()) {
            return null;
        }
        return userService.save(user, false);
    }
}