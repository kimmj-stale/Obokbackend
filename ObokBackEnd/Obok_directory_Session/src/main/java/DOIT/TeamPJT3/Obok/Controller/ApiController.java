package DOIT.TeamPJT3.Obok.Controller;

import DOIT.TeamPJT3.Obok.Repository.SourceRepository;
import DOIT.TeamPJT3.Obok.Service.DataTransformationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class ApiController {
    @Autowired
    private DataTransformationService dataTransformationService;
    @Autowired
    private SourceRepository sourceRepository;

    @GetMapping("/process")
    public String processData() {
        return "Data transformation completed";
    }

    //nn번의 복습 중
    @GetMapping("/count")
    public long allPosted() {
        //테이블 갯수 리턴
        return dataTransformationService.getDataAll();
    }

    //자주 공부한 과목 && 공부 키워드
    @GetMapping("/rating")
    public long mostVert(String data) {
        //자주 공부한 과목을 DB에서 조사 후 키워드 + 갯수 리턴
        return dataTransformationService.getDataFrequency(data);
    }

    //이해도 순위 (1~3)
    @GetMapping("/top-frequency")
    public List<Object[]> mostKeyword() {
        //가장 많았던 공부 방해요인 키워드 + 갯수 리턴
        return dataTransformationService.getTopData();
    }

    @GetMapping("/least-frequency")
    public List<Object[]> LeastKeyword(@RequestParam(defaultValue = "1") int limit) {
        //가장 적은 공부 방해요인 키워드 + 갯수 리턴
        return dataTransformationService.getLeastData(limit);
    }

    @GetMapping("/process")
    public String finMotion() {
        //공부를 끝낸 뒤 기분 비율 리턴

    }
}
