package se.diabol.microservice;

import io.dropwizard.Application;
import io.dropwizard.setup.Bootstrap;
import io.dropwizard.setup.Environment;

public class ServiceApplication extends Application<ServiceConfiguration> {

    public static void main(String[] args) throws Exception {
        new ServiceApplication().run(args);
    }


    @Override
    public void initialize(Bootstrap<ServiceConfiguration> serviceConfigurationBootstrap) {

    }

    @Override
    public void run(ServiceConfiguration configuration, Environment environment) throws Exception {
        final HelloWorldResource resource = new HelloWorldResource(
                configuration.getTemplate(),
                configuration.getDefaultName()
                );
        environment.jersey().register(resource);
    }
}
