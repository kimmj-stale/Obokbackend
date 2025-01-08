package DOIT.TeamPJT3.Obok.Controller;

import DOIT.TeamPJT3.Obok.Entity.Post;
import DOIT.TeamPJT3.Obok.repository.PostRepository;
import jakarta.persistence.PostUpdate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/post")
@CrossOrigin(origins = "http://localhost:3000")
public class postController {

    @Autowired
    private PostRepository postRepository;

    // 모든 게시글 조회
    @GetMapping
    public List<Post> getAllPosts() {
        return postRepository.findAll();
    }

    // 게시글 생성
    @PostMapping
    public Post createPost(@RequestBody Post post) {
        return postRepository.save(post);
    }

    // 게시글 수정
    @PutMapping("/{id}")
    public Post updatePost(@PathVariable Long id , @RequestBody Post post) {
        Post post1 = postRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("해당 글을 불러올 수 없습니다."));
        //저장할 데이터 타입들 전부 설정
        post1.setSubject(post.getSubject());
        post1.setPage(post.getPage());
        post1.setPerC(post.getPerC());
        post1.setMotion1(post.getMotion1());
        post1.setMotion2(post.getMotion2());
        post1.setCont1(post.getCont1());
        post1.setCont2(post.getCont2());
        post1.setCnt1(post.getCnt1());
        post1.setCnt2(post.getCnt2());
        post1.setCnt3(post.getCnt3());
        return postRepository.save(post1);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletePost(@PathVariable Long id) {
        Post post = postRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("해당 글을 불러올 수 없습니다."));
        postRepository.delete(post);
        return ResponseEntity.ok().build();
    }
}

