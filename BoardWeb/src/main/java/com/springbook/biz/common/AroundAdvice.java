package com.springbook.biz.common;

import org.aspectj.lang.ProceedingJoinPoint;

public class AroundAdvice {
	public Object aroundLog(ProceedingJoinPoint pjp) throws Throwable {
		System.out.println("[BEFORE]: What to do before running a business method...");
		Object returnObj = pjp.proceed();
		System.out.println("[AFTER ]: What to do after running a business method...");
		
		return returnObj;
	}
}
 