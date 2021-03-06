package polymorphism;

public class SamsungTV implements TV {

	private Speaker speaker;
	private int price;
	
	public SamsungTV() {
		System.out.println("===> SamsungTV(1) Object Create");
	}
	
	public void setSpeaker(Speaker speaker) {
		System.out.println("===> setSpeaker() Call");
		this.speaker = speaker;
	}

	public void setPrice(int price) {
		System.out.println("===> setPrice() Call");
		this.price = price;
	}
	
	/*
	public SamsungTV(Speaker speaker) {
		System.out.println("===> SamsungTV(2) Object Create");
		this.speaker = speaker;
	}
	
	public SamsungTV(Speaker speaker, int price) {
		System.out.println("===> SamsungTV(3) Object Create : Price (" + price +")");
		this.speaker = speaker;
	}
	
	public void initMethod() {
		System.out.println("Object Initialize Process ...");
	}
	
	public void destroyMethod() {
		System.out.println("Object Destroy Process ...");
	}
	*/
		
	@Override
	public void powerOn() {
		System.out.println("SamsungTV --- Turn On Tv : Price (" + price +")");
	}

	@Override
	public void powerOff() {
		System.out.println("SamsungTV --- Turn Off Tv");
	}

	@Override
	public void volumeUp() {
		speaker.volumeUp();
	}

	@Override
	public void volumeDown() {
		speaker.volumeDown();
	}

}
