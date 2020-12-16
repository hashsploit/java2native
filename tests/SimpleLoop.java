
public class SimpleLoop {

	private static final int COUNT_LIMIT = 10000;

	public SimpleLoop() {
		count();
	}

	private void count() {
		for (int i=0; i<COUNT_LIMIT; i++) {
			print("" + i);
		}
	}

	private void print(String msg) {
		System.out.println(msg);
	}

}


