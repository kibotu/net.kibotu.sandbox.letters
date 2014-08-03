package letters.Server.controller;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import letters.Command;
import letters.Server.model.ServerModel;
import letters.Server.view.ServerView;

public class ServerController implements Runnable, ActionListener{

	protected final ServerModel MODEL;
	protected final ServerView CANVAS;
	
	public ServerController() {
		super();
		MODEL = new ServerModel();
		CANVAS = new ServerView(this);
	}
	
	public ServerView getView() {
		return CANVAS;		
	}
	
	public void start() {
		Thread thread = new Thread(this);
		thread.start();
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		String action = e.getActionCommand();
		if(action.equals(Command.HOST_GAME.toString())) {
			CANVAS.showWaitingForPlayer();
		} else if (action.equals(Command.CONNECT_TO_GAME.toString())) {
			CANVAS.showConnect();
		} else if (action.equals(Command.SUBMIT_IP.toString())) {
			// do something with the ip
			CANVAS.showWaitingForServer();
		}
	}

	@Override
	public void run() {
		
	}
}