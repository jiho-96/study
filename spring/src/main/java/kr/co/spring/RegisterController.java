package kr.co.spring;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RegisterController {

    @RequestMapping(value = "/register/add")
    public String register() {
        return "registerForm";
    }

    @RequestMapping(value = "/register/save")
    public String save() {
        return "registerInfo";
    }

}
