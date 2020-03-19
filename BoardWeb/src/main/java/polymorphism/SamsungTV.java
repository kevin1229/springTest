package polymorphism;

public class SamsungTV implements TV {

	public void initMethod() {
		System.out.println("Object Initialize Process ...");
	}
	
	public void destroyMethod() {
		System.out.println("Object Destroy Process ...");
	}
		
	@Override
	public void powerOn() {
		// TODO Auto-generated method stub
		System.out.println("SamsungTV --- Turn On Tv");
	}

	@Override
	public void powerOff() {
		// TODO Auto-generated method stub
		System.out.println("SamsungTV --- Turn Off Tv");
	}

	@Override
	public void volumeUp() {
		// TODO Auto-generated method stub
		System.out.println("SamsungTV --- Volume Up Tv");
	}

	@Override
	public void volumeDown() {
		// TODO Auto-generated method stub
		System.out.println("SamsungTV --- Volume Down Tv");
	}

}
