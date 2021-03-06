package polymorphism;

public class SonySpeaker implements Speaker {

	public SonySpeaker() {
		System.out.println("===> Sony Speaker Object Create");
	}
	
	@Override
	public void volumeUp() {
		System.out.println("Sony Speaker --- Sounds Up!!!");
	}
	
	@Override
	public void volumeDown() {
		System.out.println("Sony Speaker --- Sounds Down!!!");
	}
}
