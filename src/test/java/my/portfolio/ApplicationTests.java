package my.portfolio;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.sql.DataSource;

@SpringBootTest
class ApplicationTests {

	@Autowired
	DataSource dataSource;

	@Test
	void contextLoads() {
	}

	@Test
	void db연결확인() {
		Assertions.assertNotNull(dataSource);
	}
}
