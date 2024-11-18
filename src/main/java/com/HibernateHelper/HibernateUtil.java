package com.HibernateHelper;


import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;


public class HibernateUtil {
	public static StandardServiceRegistry registry;
	public static SessionFactory sessionFactory;
	public static SessionFactory getSessionFactory() {
		if(sessionFactory == null) {
			registry = new StandardServiceRegistryBuilder().configure().build();
			MetadataSources mts = new MetadataSources(registry);
			Metadata mt = mts.getMetadataBuilder().build();
			sessionFactory = mt.buildSessionFactory();
		}
		return sessionFactory;
	}
}
