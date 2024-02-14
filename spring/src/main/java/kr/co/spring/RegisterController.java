package kr.co.spring;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.net.URLEncoder;


@Controller
public class RegisterController {


    @RequestMapping(value = "/register/add", method = {RequestMethod.GET, RequestMethod.POST})
    public String register() {
        return "registerForm";
    }
/*    @GetMapping(value = "/register/add")
    public String register() {
        return "registerForm";
    }*/


    @PostMapping("/register/save")
    public String save(User user, Model model) throws Exception {
        // 유효성검사
        if (!isValid(user)){
            String msg = URLEncoder.encode("id를 잘못입력하셨습니다.", "utf-8");

            model.addAttribute("msg", msg);
            return "forward:add";
            //return "redirect:add?msg=" + msg; // URL재작성
        }
        return "registerInfo";
    }

    private boolean isValid(User user){
        return true;
        // return false;
    }
}
