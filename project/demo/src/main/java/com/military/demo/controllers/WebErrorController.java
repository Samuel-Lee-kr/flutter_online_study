package com.military.demo.controllers;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import com.military.demo.controllers.constants.RootRouterConstant;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(RootRouterConstant.URL_ERROR_ROOT)
public class WebErrorController implements ErrorController {
    
    @RequestMapping(RootRouterConstant.URL_ERROR_ERROR)
    public String handleError(HttpServletRequest request) {
        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        if (status != null) {
            int statusCode = Integer.valueOf(status.toString());
            if (statusCode == HttpStatus.NOT_FOUND.value()) {
                return RootRouterConstant.HTML_ERROR_404;
            }
            if (statusCode == HttpStatus.FORBIDDEN.value()) {
                return RootRouterConstant.HTML_ERROR_ERROR;
            }
        }
        return RootRouterConstant.HTML_ERROR_ERROR;
    }

    @GetMapping(RootRouterConstant.URL_ERROR_403)
    public String error403() {
        return RootRouterConstant.HTML_ERROR_403;
    }

}
