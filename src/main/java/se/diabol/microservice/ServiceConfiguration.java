package se.diabol.microservice;

import com.fasterxml.jackson.annotation.JsonProperty;

import io.dropwizard.Configuration;

import org.hibernate.validator.constraints.NotEmpty;

public class ServiceConfiguration extends Configuration {

    @NotEmpty
    private String template = "Hello, %s!";

    @NotEmpty
    private String defaultName = "Stranger";

    //private SimpleServerFactory server = new SimpleServerFactory();

    @JsonProperty
    public String getTemplate() {
        return template;
    }

    @JsonProperty
    public void setTemplate(String template) {
        this.template = template;
    }

    @JsonProperty
    public String getDefaultName() {
        return defaultName;
    }

    @JsonProperty
    public void setDefaultName(String name) {
        this.defaultName = name;
    }

//    public SimpleServerFactory getServer() {
//        return server;
//    }
//
//    public void setServer(SimpleServerFactory server) {
//        this.server = server;
//    }

}
