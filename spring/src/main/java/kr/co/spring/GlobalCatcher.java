package kr.co.spring;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.io.FileNotFoundException;

// 컨트롤러에서 발생하는 예외를 처리
@ControllerAdvice("kr.co.spring2") // 패키지 적용가능, 일부로 다른 패키지명으로
// @ControllerAdvice // 모든 패키지 적용
public class GlobalCatcher {

    @ExceptionHandler(Exception.class)
    public String catcher(Exception ex, Model model){
        model.addAttribute("ex", ex);
        return "error";
    }

    @ExceptionHandler({NullPointerException.class, FileNotFoundException.class})
    public String catcher2(Exception ex, Model model){
        model.addAttribute("ex", ex);
        return "error";
    }
}
