package hello.world.studi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController // Ajout de l'annotation pour exposer un endpoint web
public class StudiApplication {

    public static void main(String[] args) {
        SpringApplication.run(StudiApplication.class, args);
    }

    @GetMapping("/") // Endpoint accessible à la racine
    public String helloWorld() {
        return "Hello Studi!";
    }
}
