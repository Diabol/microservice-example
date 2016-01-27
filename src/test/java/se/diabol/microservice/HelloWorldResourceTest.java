package se.diabol.microservice;

import static org.junit.Assert.assertEquals;

import com.google.common.base.Optional;

import org.junit.Before;
import org.junit.Test;

public class HelloWorldResourceTest {

    private HelloWorldResource target;

    @Before
    public void setUp() throws Exception {
        target = new HelloWorldResource("Hi %s!", "Spindelmannen");
    }

    @Test
    public void testSayHelloKalle() {
        Saying sayHelloKalle = target.sayHello(Optional.of("Kalle"));
        assertEquals("Hi Kalle!", sayHelloKalle.getContent());
    }

}
