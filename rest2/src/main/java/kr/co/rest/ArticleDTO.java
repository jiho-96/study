package kr.co.rest;

import lombok.Data;
import lombok.ToString;


@Data
@ToString
public class ArticleDTO {
    private int articleNo;
    private String writer;
    private String title;
    private String content;
}
