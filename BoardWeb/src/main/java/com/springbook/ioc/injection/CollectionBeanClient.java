package com.springbook.ioc.injection;

import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class CollectionBeanClient {
	public static void main(String[] args) {
		
		AbstractApplicationContext factory = new GenericXmlApplicationContext("applicationContext.xml");
		CollectionBean bean = (CollectionBean)factory.getBean("collectionBean");
		
		List<String> addressList = bean.getAddressList();
		for(String addr : addressList) {
			
			System.out.println(addr.toString());
		}
		
		Set<String> addressSet = bean.getAddressSet();
		for(String addr : addressSet) {
			
			System.out.println(addr.toString());
		}
		
		Map<String,String> addressMap = bean.getAddressMap();
		for(String key : addressMap.keySet()) {
			
			System.out.println(key + " " + addressMap.get(key));
		}
		
		Properties probs = bean.getAddressProbs();
		probs.forEach((key, value) -> System.out.println(key + " " + value));
		
		factory.close();
	}
}
