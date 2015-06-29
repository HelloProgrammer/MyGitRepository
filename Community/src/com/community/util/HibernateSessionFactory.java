package com.community.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;

public class HibernateSessionFactory {

	private static SessionFactory sessionFactory = null;
	private static AnnotationConfiguration configuration = new AnnotationConfiguration();
    private static String CONFIG_FILE_LOCATION = "hibernate/hibernate.cfg.xml";
    private static String configFile = CONFIG_FILE_LOCATION;
    
    private HibernateSessionFactory() {
		
	}
    
    public static SessionFactory getSessionFactory() {
		if (sessionFactory == null) {
			configuration.configure(configFile);
			sessionFactory = configuration.buildSessionFactory();
		}
		return sessionFactory;
	}
}
