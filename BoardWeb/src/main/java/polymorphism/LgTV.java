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
		// TODO Auto-generated constructor stub
		System.out.println("===> LgTV Object Create");
	}
	
	@Override
	public void powerOn() {
		// TODO Auto-generated method stub
		System.out.println("LgTV --- Turn On Tv");
	}

	@Override
	public void powerOff() {
		// TODO Auto-generated method stub
		System.out.println("LgTV --- Turn Off Tv");
	}

	@Override
	public void volumeUp() {
		// TODO Auto-generated method stub
		speaker.volumeUp();
//		System.out.println("LgTV --- Volume Up Tv");
	}

	@Override
	public void volumeDown() {
		// TODO Auto-generated method stub
		speaker.volumeDown();
//		System.out.println("LgTV --- Volume Down Tv");
	}
	
}
