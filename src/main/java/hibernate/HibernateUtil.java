package hibernate;

import entities.*;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

import java.util.Properties;

public class HibernateUtil {
    private static SessionFactory sessionFactory;

    public static SessionFactory getSessionFactory() {
        if (sessionFactory == null) {
            try {
                Configuration configuration =new Configuration();

                Properties settings = new Properties();
                settings.put(Environment.DRIVER , "org.postgresql.Driver");
                settings.put(Environment.URL ,"jdbc:postgresql://localhost:5432/amis_escalade");
                settings.put(Environment.USER , "admin_escalade");
                settings.put(Environment.PASS, "AdamOndra");
                settings.put(Environment.DIALECT , "org.hibernate.dialect.PostgreSQL95Dialect");
                settings.put(Environment.CURRENT_SESSION_CONTEXT_CLASS , "thread");
                settings.put(Environment.HBM2DDL_AUTO , "update");

                settings.put(Environment.SHOW_SQL , "true");

                configuration.setProperties(settings);
                configuration.addAnnotatedClass(Boulder.class);
                configuration.addAnnotatedClass(Climber.class);
                configuration.addAnnotatedClass(Com.class);
                configuration.addAnnotatedClass(MultiPitch.class);
                configuration.addAnnotatedClass(Place.class);
                configuration.addAnnotatedClass(Route.class);
                configuration.addAnnotatedClass(Sector.class);
                configuration.addAnnotatedClass(SinglePitch.class);
                configuration.addAnnotatedClass(Topo.class);

                ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties()).build();
                sessionFactory = configuration.buildSessionFactory(serviceRegistry);
                return sessionFactory;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return sessionFactory;
    }
}
