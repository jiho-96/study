package kr.co.rest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

// RestController 이용
@RestController
@RequestMapping("/test")
public class TestController {

    // hello로 요청시 브라우저에 문자열을 전송
    @RequestMapping("/hello")
    public String hello(){
        return "Hello REST!";
    }


    // RestController로 DTO 객체 전달
    // MemberDTO 객체의 속성 값을 저장한 후 JSON으로 전송
    @RequestMapping("/member")
    public MemberDTO member(){
        MemberDTO memberDTO = new MemberDTO();
        memberDTO.setId("Rest");
        memberDTO.setPwd("123123");
        memberDTO.setName("레스트");
        memberDTO.setEmail("Rest@test.com");
        return memberDTO;
    }


    // RestController로 컬렉션 객체 전달
    // list로 전달해서 json 배열로
    @RequestMapping("/membersList")
    public List<MemberDTO> membersList(){
        // MemberDTO 객체를 저장할 ArrayList 객체 생성
        List<MemberDTO> memberDTOList = new ArrayList<MemberDTO>();

        // MemberDTO 객체를 여러개 생성해서 ArrayList에 저장
        for (int i=0; i<10; i++){
            MemberDTO memberDTO = new MemberDTO();
            memberDTO.setId("RestList" + i);
            memberDTO.setPwd("123123" + i);
            memberDTO.setName("레스트리스트" + i);
            memberDTO.setEmail("RestList" + i + "@test.com");
            memberDTOList.add(memberDTO);
        }

        // ArrayList를 JSON으로 브라우저에 전송
        return memberDTOList;
    }

    // RestController로 Map 전달
    @RequestMapping("/membersMap")
    public Map<Integer, MemberDTO> memberDTOMap(){
        // MemberDTO 객체를 저장할 HashMap 객체 생성
        Map<Integer, MemberDTO> memberDTOMap = new HashMap<Integer, MemberDTO>();

        // MemberDTO 객체를 HashMap에 저장
        for (int i=0; i<10; i++){
            MemberDTO memberDTO = new MemberDTO();
            memberDTO.setId("RestMap" + i);
            memberDTO.setPwd("123123" + i);
            memberDTO.setName("레스트맵" + i);
            memberDTO.setEmail("RestMap" + i + "@test.com");
            memberDTOMap.put(i, memberDTO);
        }
        return memberDTOMap;
    }

    // PathVariable 사용
    // http://localhost:8080/test/notice/22 입력시, 22가 num에 할당
    @RequestMapping(value = "/notice/{num}", method = RequestMethod.GET)
    public int notice(@PathVariable("num") int num) throws Exception{
        return num;
    }


    // String 작성시 Content-Type: text/html 형식이 됨
    @RequestMapping(value = "/stnotice/{st}", method = RequestMethod.GET)
    public String notice(@PathVariable("st") String st) throws Exception{
        return st;
    }

    private static final Logger log = LogManager.getLogger(TestController.class);

    // RequestBody 사용
    // 브라우저에서 전달되는 json 데이터를 객체로 자동 변환
    // JSONTest.jsp에서 버튼을 클릭하여, ajax를 이용해 회원 정보를 json으로 만들어 컨트롤러로 보냄
    @PostMapping("/info")
    public void modify(@RequestBody MemberDTO memberDTO){
        log.info("Member details: {}", memberDTO.toString());
    }

    // ResponseEntity 사용해 응답하기
    // @RestCOntroller는 별도의 View를 제공하지 않은 채 데이터를 전달하므로 전달 과정에서 예외가 발생할 수 있음
    // 이 예외에 대해 좀 더 세밀한 제어가 필요한 경우 ResponseEntity 클래스를 사용

    @RequestMapping("membersList2")
    public ResponseEntity<List<MemberDTO>> listMember2(){
        List<MemberDTO> memberDTOList = new ArrayList<MemberDTO>();
        for (int i=0; i<10; i++){
            MemberDTO memberDTO = new MemberDTO();
            memberDTO.setId("Rest" + i);
            memberDTO.setName("레스트" + i);
            memberDTO.setPwd("123123" + i);
            memberDTO.setEmail("Rest" + i + "@test.com");
            memberDTOList.add(memberDTO);
        }
        // 오류코드 500으로 응답
        // f12를 보면 Status가 500
        return new ResponseEntity(memberDTOList, HttpStatus.INTERNAL_SERVER_ERROR);
    }

    // HttpHeaders 클래스를 이용해서 ResponseEntity로 전송할 데이터의 종류와 한글 인코딩 설정
    @RequestMapping("/res3")
    public ResponseEntity res3(){
        HttpHeaders responseHeaders = new HttpHeaders();

        // 전송할 데이터의 종류와 인코딩을 설정
        responseHeaders.add("Content-Type", "text/html; charset=utf-8");

        // 전송할 데이터의 종류와 인코딩을 설정
        String message = "<script>";
        message += " alert('새 회원을 등록하겠습니다.' );";
        message += " location.href='/test/membersList2'; ";
        message += "</script>";

        // ResponseEntity를 이용해 Html 형식으로 전송
        return new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
    }
}
