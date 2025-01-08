package DOIT.TeamPJT3.Obok.Entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
@Entity
public class TargetTable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String transformedData;

    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getTransformedData() {
        return transformedData;
    }
    public void setTransformedData(String transformedData) {
        this.transformedData = transformedData;
    }

}
