package DOIT.TeamPJT3.Obok.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "data")
@Getter
@Setter
public class Post {
    //index
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    //과목
    @Column(nullable = false , name = "subject")
    private Long subject;

    //공부량
    @Column(nullable = false , name = "page")
    private Long page;

    //이해도
    @Column(nullable = false , name = "perC")
    private Integer perC;

    //마음가짐
    @Column(nullable = false , name = "motion1")
    private Integer motion1;

    //마음가짐2
    @Column(nullable = false , name = "motion2")
    private Integer motion2;

    //일기 내용
    @Column(nullable = false, columnDefinition = "VARCHAR(255) DEFAULT 'No Content'")
    private String cont1;

    //아쉬웠던 점
    @Column(nullable = false , columnDefinition = "VARCHAR(255) DEFAULT 'NO content'")
    private String cont2;

    //아쉬운 점
    @Column(nullable = false , name = "cnt1")
    private Integer cnt1;

    //학습 능력
    @Column(nullable = false , name = "cnt2")
    private Integer cnt2;

    //외부요인
    @Column(nullable = false , name = "cnt3")
    private Integer cnt3;

    public void setId(Long id) {
        this.id = id;
    }

    public void setSubject(Long subject) {
        this.subject = subject;
    }

    public void setPage(Long page) {
        this.page = page;
    }

    public void setPerC(Integer perC) {
        this.perC = perC;
    }

    public void setMotion1(Integer motion1) {
        this.motion1 = motion1;
    }

    public void setMotion2(Integer motion2) {
        this.motion2 = motion2;
    }

    public void setCont1(String cont1) {
        this.cont1 = cont1;
    }

    public void setCont2(String cont2) {
        this.cont2 = cont2;
    }

    public void setCnt1(Integer cnt1) {
        this.cnt1 = cnt1;
    }

    public void setCnt2(Integer cnt2) {
        this.cnt2 = cnt2;
    }

    public void setCnt3(Integer cnt3) {
        this.cnt3 = cnt3;
    }

    public Long getId() {
        return id;
    }

    public Long getSubject() {
        return subject;
    }

    public Long getPage() {
        return page;
    }

    public Integer getPerC() {
        return perC;
    }

    public Integer getMotion1() {
        return motion1;
    }

    public Integer getMotion2() {
        return motion2;
    }

    public String getCont1() {
        return cont1;
    }

    public String getCont2() {
        return cont2;
    }

    public Integer getCnt1() {
        return cnt1;
    }

    public Integer getCnt2() {
        return cnt2;
    }

    public Integer getCnt3() {
        return cnt3;
    }
}

