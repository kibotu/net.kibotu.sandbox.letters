package letters;

public enum Command {
	
	HOST_GAME("HOST_GAME"),
	CONNECT_TO_GAME("CONNECT_TO_GAME"), 
	SUBMIT_IP("SUBMIT_IP");
	
	private final String cmd;
	
	Command(String cmd) {
		this.cmd = cmd;
	}

	public String toString() {
		return cmd;
	}
}
