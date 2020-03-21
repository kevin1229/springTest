package polymorphism;

public class AppleSpeaker implements Speaker {

	public AppleSpeaker() {
		System.out.println("==> AppleSpeaker Object Create");
	}
	@Override
	public void volumeUp() {
		System.out.println("AppleSpeaker --- Volume Up");

	}

	@Override
	public void volumeDown() {
		System.out.println("AppleSpeaker --- Volume Down");
	}

}
