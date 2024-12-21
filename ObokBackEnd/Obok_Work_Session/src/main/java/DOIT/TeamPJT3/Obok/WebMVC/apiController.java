package DOIT.TeamPJT3.Obok.WebMVC;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "http://localhost:3000")
public class apiController {
    @GetMapping("/data")
    public ResponseEntity<String> getData(){
        return ResponseEntity.ok("Hello World");
    }
}
