package DOIT.TeamPJT3.Obok.Entity;

import jakarta.annotation.Nullable;
import jakarta.persistence.*;

@Entity
@Table(name = "post")
public class Post {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private long Id;
    @Column(nullable = false)
    private String Title;
    @Column(nullable = false , columnDefinition = "TEXT")
    private String contents;

    public Post() {}

    //Lombok
    public long getId() {
        return Id;
    }
    public void setId(long id) {
        this.Id = id;
    }
    public String getTitle() {
        return Title;
    }
    public void setTitle(String title) {
        Title = title;
    }
    public String getContents() {
        return contents;
    }
    public void setContents(String contents) {
        this.contents = contents;
    }

}
