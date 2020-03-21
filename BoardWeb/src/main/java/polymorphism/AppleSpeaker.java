package polymorphism;

public class AppleSpeaker implements Speaker {

	public AppleSpeaker() {
		System.out.println("==> AppleSpeaker Object Create");
	}
	@Override
	public void volumeUp() {
		// TODO Auto-generated method stub
		System.out.println("AppleSpeaker --- Volume Up");

	}

	@Override
	public void volumeDown() {
		// TODO Auto-generated method stub
		System.out.println("AppleSpeaker --- Volume Down");
	}

}
