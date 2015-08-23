package com.zsgl.util;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Aspect;

@Aspect
public class EntityManagerProxy implements InvocationHandler {

	EntityManager entityManager;
	
	public EntityManager getEntityManager() {
		return entityManager;
	}

	public void setEntityManager(EntityManager entityManager) {
		this.entityManager = entityManager;
	}

	public EntityManagerProxy() {
	}
	
	public EntityManagerProxy(EntityManager entityManager) {
		this.entityManager = entityManager;
	}
	
	public Object execute(ProceedingJoinPoint pj) throws Throwable {
		EntityManager em = (EntityManager)pj.proceed();
		return Proxy.newProxyInstance(EntityManager.class.getClassLoader(), new Class[]{EntityManager.class}, new EntityManagerProxy(em));
	}

	@Override
	public Object invoke(Object proxy, Method method, Object[] args)
			throws Throwable {
		Object obj = null;
		if(method.getName().equals("createQuery")) {
			Query query = (Query)method.invoke(entityManager, args);
			obj = query.setHint("org.hibernate.cacheable", true);
		} else {
			obj = method.invoke(entityManager, args);
		}
		return obj;
	}

}
