package kr.co.spring;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.FileNotFoundException;


@Controller
public class ExceptionController {

    // 해당 컨트롤러 내부에 오류가 발생하면 해당 메서드가 받아서 처리
    @ExceptionHandler(Exception.class)
    public String catcher(Exception ex, Model model){
        System.out.println("catcher() in ExceptionController");
        System.out.println("model="+model);
        model.addAttribute("ex", ex);
        return "error";
    }

    @ExceptionHandler({NullPointerException.class, FileNotFoundException.class})
    public String catcher2(Exception ex, Model model){
        model.addAttribute("ex", ex);
        return "error";
    }

    @RequestMapping("/ex")
    public String main(Model model) throws  Exception{
        model.addAttribute("msg", "message from ExceptionController.main()");
        throw new Exception("예외가 발생했습니다.");
    }

    @RequestMapping("/ex2")
    public String main2() throws  Exception{
        throw new NullPointerException("예외가 발생했습니다.");
    }

    // 해당 에러 처리가 없으면 조상인 Exception.class가 처리
    @RequestMapping("/ex3")
    public String main3() throws  Exception{
        throw new FileNotFoundException("예외가 발생했습니다.");
    }
}
