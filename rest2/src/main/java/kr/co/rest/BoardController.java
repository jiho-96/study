package kr.co.rest;

import lombok.extern.log4j.Log4j2;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/boards")
public class BoardController {
    private static final Logger log = LogManager.getLogger(BoardController.class);

    // Get 방식, 전체 글 조회
    @GetMapping("/all")
    public ResponseEntity<List<ArticleDTO>> listArticles(){
        log.info("listArticles 메소드 호출");
        List<ArticleDTO> articleDTOList = new ArrayList<ArticleDTO>();

        for (int i=0; i<10; i++){
            ArticleDTO articleDTO = new ArticleDTO();
            articleDTO.setArticleNo(i);
            articleDTO.setWriter("tester" + i);
            articleDTO.setTitle("testTitle" + i);
            articleDTO.setContent("testContent" + i);
            articleDTOList.add(articleDTO);
        }
        return new ResponseEntity(articleDTOList, HttpStatus.OK);
    }

    // Get 방식, 글 번호에 대한 정보 조회, 선택한 글에 대한 자료만 가져옴
    @GetMapping("/{articleNo}")
    public ResponseEntity<ArticleDTO> findArticle(
            @PathVariable("articleNo") Integer articleNo) {
        log.info("findArticle 메소드 호출");

        ArticleDTO articleDTO = new ArticleDTO();
        articleDTO.setArticleNo(articleNo);
        articleDTO.setWriter("tester");
        articleDTO.setTitle("test 중입니다");
        articleDTO.setContent("test 글 입니다");

        return new ResponseEntity(articleDTO, HttpStatus.OK);
    }

    // post 방식, 요청이 들어오면 json으로 전달되는 객체를 새 글로 추가
    @PostMapping("")
    public ResponseEntity<String> addArticle(@RequestBody ArticleDTO articleDTO) {
        ResponseEntity<String> resEntity = null;
        try {
            log.info("addArticle 메소드 호출");
            log.info(articleDTO.toString());
            resEntity = new ResponseEntity<String>("ADD_SUCCEEDED", HttpStatus.OK);
        } catch (Exception e) {
            resEntity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return resEntity;
    }


    // put 방식으로 요청, json 방식으로 수정
    @PutMapping("/{articleNo}")
    public ResponseEntity<String> modArticle(
            @PathVariable("articleNo")Integer articleNo, @RequestBody ArticleDTO articleDTO) {
        ResponseEntity<String> resEntity = null;
        try {
            log.info("modArticle 메소드 호출");
            log.info(articleDTO.toString());
            resEntity = new ResponseEntity<String>("MOD_SECCEEDED", HttpStatus.OK);
        } catch (Exception e) {
            resEntity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return resEntity;
    }


    // Delete 방식, 전달되는 articleNo에 대한 글을 삭제
    @RequestMapping(value = "/{articleNo}", method = RequestMethod.DELETE)
    public ResponseEntity<String> removeArticle (@PathVariable("articleNo") Integer articleNo) {
        ResponseEntity<String> resEntity = null;
        try {
            log.info("removeArticle 메서드 호출합니다");
            log.info(articleNo.toString());
            resEntity = new ResponseEntity<String>("REMOVE_SECCEEDED", HttpStatus.OK);
        } catch (Exception e) {
            resEntity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return resEntity;
    }
}
