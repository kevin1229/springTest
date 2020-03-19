package polymorphism;

public class SamsungTV implements TV {

	private SonySpeaker speaker;
	
	public SamsungTV() {
		System.out.println("===> SamsungTV(1) Object Create");
	}
	
	public SamsungTV(SonySpeaker speaker) {
		System.out.println("===> SamsungTV(2) Object Create");
		this.speaker = speaker;
	}
	
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
		speaker.volumeUp();
	}

	@Override
	public void volumeDown() {
		// TODO Auto-generated method stub
		speaker.volumeDown();
	}

}
