package polymorphism;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("tv")
public class LgTV implements TV {

//	@Autowired
//	@Qualifier("apple")
//	@Resource(name="apple")
	
	@Autowired
	private Speaker speaker;
	
	public LgTV() {
		System.out.println("===> LgTV Object Create");
	}
	
	@Override
	public void powerOn() {
		System.out.println("LgTV --- Turn On Tv");
	}

	@Override
	public void powerOff() {
		System.out.println("LgTV --- Turn Off Tv");
	}

	@Override
	public void volumeUp() {
		speaker.volumeUp();
//		System.out.println("LgTV --- Volume Up Tv");
	}

	@Override
	public void volumeDown() {
		speaker.volumeDown();
//		System.out.println("LgTV --- Volume Down Tv");
	}
	
}
