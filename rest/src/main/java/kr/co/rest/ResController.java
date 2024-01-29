package kr.co.rest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@Controller
public class ResController {
    @RequestMapping("/res1")
    // 메소드 호출시 데이터를 전송하도록 설정
    // 컨트롤러의 특정 메소드에 달아놓으면 JSP가 아닌 텍스트나 json으로 결과를 전송할 수 있음
    @ResponseBody // ResponseBody 사용
    public Map<String, Object> res1(){ // Map 데이터를 브라우저로 전송
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("id", "Rest");
        map.put("name", "레스트");
        return map;
    }

    // 메소드 호출 시 home.jsp를 브라우저로 전송
    @RequestMapping("/res2")
    public ModelAndView res2(){
        return new ModelAndView("home");
    }
}
