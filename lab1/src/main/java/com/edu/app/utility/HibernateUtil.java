package com.edu.app.utility;

import com.edu.app.model.User;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

import java.util.Properties;

public class HibernateUtil {
    private final static SessionFactory FACTORY;

    static {
        Configuration conf = new Configuration();
        Properties pros = new Properties();
        pros.put(Environment.DIALECT, "org.hibernate.dialect.MySQL8Dialect");
        pros.put(Environment.DRIVER, "com.mysql.cj.jdbc.Driver");
        pros.put(Environment.URL, "jdbc:mysql://localhost:3306/lab1java5");
        pros.put(Environment.USER, "root");
        pros.put(Environment.PASS, "123456");
        pros.put(Environment.SHOW_SQL, "true");
//        pros.put(Environment.HBM2DDL_AUTO, "create");
//        pros.put(Environment.CURRENT_SESSION_CONTEXT_CLASS, "thread");

        conf.setProperties(pros);
        conf.addAnnotatedClass(User.class);


        ServiceRegistry registry = new StandardServiceRegistryBuilder().applySettings(conf.getProperties()).build();

        FACTORY = conf.buildSessionFactory(registry);
    }
    public static SessionFactory getSessionFactory() {
        return FACTORY;
    }
}
