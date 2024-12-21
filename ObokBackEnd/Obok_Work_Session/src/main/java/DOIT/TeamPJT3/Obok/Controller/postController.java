package DOIT.TeamPJT3.Obok.Controller;

import DOIT.TeamPJT3.Obok.Entity.Post;
import DOIT.TeamPJT3.Obok.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/post")
public class postController {
    @Autowired
    //Di 셍성
    private PostRepository postRepository;
    //get
    @GetMapping
    public List<Post> getAll() {
        return postRepository.findAll();
    }

    @GetMapping("/{id}")
    public Post getPostId(@PathVariable Long id) {
        return postRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("contents not found"));
    }

    //update
    @PostMapping
    public Post updatePost(@PathVariable Long id , @RequestBody Post newpost) {
        Post post = postRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("contents not found"));
        post.setTitle(newpost.getTitle());
        post.setContents(newpost.getContents());

        return postRepository.save(post);
    }

    //delete
    @DeleteMapping
    public void deletePost(@PathVariable Long id) {
        postRepository.deleteById(id);
    }
}
