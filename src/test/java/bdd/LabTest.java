package bdd;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.Runner;
import com.intuit.karate.Results;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.util.logging.Logger;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class LabTest {
    private static final Logger logger = Logger.getLogger(LabTest.class.getName());

    @Test
    void testAllFeatures() {
        Results results = Runner.path("classpath:bdd").parallel(1);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
        logger.info("Ejecución de features completada");
    }

    @BeforeAll
    public static void beforeAll() {
        logger.info("-----------------BeforeAll-----------------");
        // Lógica de inicialización global
    }

    @AfterAll
    public static void afterAll() {
        logger.info("-----------------AfterAll-----------------");
        // Lógica de limpieza global
    }
}