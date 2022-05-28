package com.military.demo.controllers.constants;

public class RootRouterConstant {

    private RootRouterConstant() {
    }

    // HomeController URL, HTML 경로
    public static final String URL_ROOT = "/";

    public static final String REDIRECT = "redirect:";

    public static final String URL_ROOT_INDEX = "/";
    public static final String HTML_ROOT_INDEX = "/contents/index";

    public static final String URL_ROOT_LOGIN = "/login";
    public static final String HTML_ROOT_LOGIN = "/contents/login/login";

    public static final String URL_ROOT_JOIN = "/join";
    public static final String HTML_ROOT_JOIN = "/contents/login/join";

    public static final String URL_ROOT_FORGOT = "/forgot";
    public static final String HTML_ROOT_FORGOT = "/contents/login/forgot";

    public static final String URL_ROOT_PROFILE = "/profile";
    public static final String HTML_ROOT_PROFILE = "/contents/login/profile";

    // WebErrorController URL, HTML 경로
    public static final String URL_ERROR_ROOT = "/";

    public static final String URL_ERROR_ERROR = "/error";
    public static final String HTML_ERROR_404 = "/contents/error/404.html";
    public static final String HTML_ERROR_ERROR = "/contents/error/error.html";

    public static final String URL_ERROR_403 = "/error/403";
    public static final String HTML_ERROR_403 = "/contents/error/403.html";

}
