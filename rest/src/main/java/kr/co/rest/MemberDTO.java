package kr.co.rest;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Data
@RequiredArgsConstructor
@ToString
public class MemberDTO {
    private String id;
    private String pwd;
    private String name;
    private String email;
}
