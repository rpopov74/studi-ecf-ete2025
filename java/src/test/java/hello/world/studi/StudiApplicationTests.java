package hello.world.studi;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
class StudiApplicationTests {

	@Test
	void contextLoads() {
	}
	void helloWorldEndpointReturnsHelloWorld() {
        String message = "Hello World!";
        assertThat(message).isEqualTo("Hello World!");
    }

}
