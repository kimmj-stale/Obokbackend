package DOIT.TeamPJT3.Obok.Service;

import DOIT.TeamPJT3.Obok.Entity.SourceTable;
import DOIT.TeamPJT3.Obok.Entity.TargetTable;
import DOIT.TeamPJT3.Obok.Repository.SourceRepository;
import DOIT.TeamPJT3.Obok.Repository.TableRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class DataTransformationService {
    @Autowired
    private TableRepository tableRepository;
    @Autowired
    private SourceRepository sourceRepository;

    //전체 데이터 갯수 리턴
    public long getDataAll() {
        return sourceRepository.count();
    }

    //데이터 등장 빈도 수 리턴
    public long getDataFrequency(String data) {
        return sourceRepository.countByData(data);
    }

    //상위 키워드 data 3개 리턴
    public List<Object[]> getTopData() {
        return sourceRepository.findTopData(PageRequest.of(0 , 3)).getContent();
    }

    //최하위 키워드 data 1개 리턴
    public List<Object[]> getLeastData(int limit) {
        return sourceRepository.findLeastData(PageRequest.of(0 , limit)).getContent();
    }



    public void dataTransformation(){
        List<SourceTable> sourceData = sourceRepository.findAll();

        List<TargetTable> tableData = sourceData.stream()
                .map(source -> {
                    TargetTable target = new TargetTable();
                    target.setTransformedData(source.getData().toUpperCase());
                    return target;
                }).collect(Collectors.toList());
        tableRepository.saveAll(tableData);
    }
}
