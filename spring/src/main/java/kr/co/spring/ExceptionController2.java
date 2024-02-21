package kr.co.spring;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.FileNotFoundException;


@Controller
public class ExceptionController2 {

    //GlobalCatcher에서 예외 처리

    @RequestMapping("/ex4")
    public String main() throws  Exception{
        throw new Exception("예외가 발생했습니다.");
    }


    @RequestMapping("/ex5")
    public String main2() throws  Exception{
        throw new FileNotFoundException("예외가 발생했습니다.");
    }
}
