package com.military.demo.controllers;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import com.military.demo.controllers.constants.RootRouterConstant;
import com.military.demo.models.User;
import com.military.demo.services.UserService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping(RootRouterConstant.URL_ROOT)
public class RootController {
    
    private final UserService userService;

    @GetMapping(RootRouterConstant.URL_ROOT_INDEX)
    public String index() {
        return RootRouterConstant.HTML_ROOT_INDEX;
    }

    @GetMapping(RootRouterConstant.URL_ROOT_LOGIN)
    public String loginPage(@RequestParam(required = false) boolean error, @RequestParam(required = false) String msg,
            Model model, Principal principal) {
        System.out.println(principal);
        if (principal != null) {
            return RootRouterConstant.REDIRECT + RootRouterConstant.URL_ROOT;
        }
        model.addAttribute("error", error);
        if (error) {
            switch (msg) {
                case "check-email-or-password":
                    model.addAttribute("msg", "이메일 혹은 패스워드를 확인해주세요");
                    break;
            }
        }
        return RootRouterConstant.HTML_ROOT_LOGIN;
    }

    @GetMapping(RootRouterConstant.URL_ROOT_JOIN)
    public String joinPage(Principal principal) {
        System.out.println(principal);
        if (principal != null) {
            return RootRouterConstant.REDIRECT + RootRouterConstant.URL_ROOT;
        }
        return RootRouterConstant.HTML_ROOT_JOIN;
    }

    @PostMapping(RootRouterConstant.URL_ROOT_JOIN)
    @ResponseBody
    public Map<String, Object> join(@RequestBody User user) {

        Map<String, Object> res = new HashMap<>();
        if (userService.findByEmail(user.getEmail()).isPresent()) {
            res.put("success", false);
        } else {
            userService.save(user, false);
            res.put("success", true);
        }
        return res;
    }

    @GetMapping(RootRouterConstant.URL_ROOT_FORGOT)
    public String forgotPage(Principal principal) {
        System.out.println(principal);
        if (principal != null) {
            return RootRouterConstant.REDIRECT + RootRouterConstant.URL_ROOT;
        }
        return RootRouterConstant.HTML_ROOT_FORGOT;
    }

    @GetMapping(RootRouterConstant.URL_ROOT_PROFILE)
    public String profile() {
        return RootRouterConstant.HTML_ROOT_PROFILE;
    }
}
