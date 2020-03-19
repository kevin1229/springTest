package polymorphism;

public class BeanFactory {
	public Object getBean(String beanName) {
		
		TV tv = null;
		
		if(beanName.equals("samsung")) {
		
			tv = new SamsungTV();
			
		} else if(beanName.equals("lg")) {
			
			tv = new LgTV();
			
		}
		
		return tv;
	}
}
