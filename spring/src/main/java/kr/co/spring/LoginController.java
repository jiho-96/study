package kr.co.spring;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

@Controller
@RequestMapping("/login")
public class LoginController {
    @GetMapping("/login")
    public String loginForm(){
        return "loginForm";
    }

    @PostMapping("/login")
    public String login(String id, String pwd, boolean rememberId, HttpServletResponse response) throws Exception {
        System.out.println("id=" + id);
        System.out.println("pwd=" + pwd);
        System.out.println("rememberId=" + rememberId);
        //id와 pwd를 확인
        if (!logCheck(id, pwd)){
            String msg = URLEncoder.encode("id 또는 pwd가 일치하지 않습니다.", "utf-8");

            // 일치하지 않으면, loginFrom으로 이동
            return "redirect:/login/login?msg=" + msg;
        }
        // id와 pwd가 일치하면

        // 체크박스를 체크하면
        if (rememberId){
            // 쿠키를 생성
            Cookie cookie = new Cookie("id", id);
            response.addCookie(cookie);
        } else {
            // 쿠키를 삭제
            Cookie cookie = new Cookie("id", id);
            cookie.setMaxAge(0); // 시간을 0으로
            response.addCookie(cookie);
        }

        //홈으로 이동
        return "redirect:/";
    }

    private boolean  logCheck(String id, String pwd){
        return "asdf".equals(id) && "1234".equals(pwd);
    }
}
