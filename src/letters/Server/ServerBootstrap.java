package letters.Server;

import java.awt.Container;

import javax.swing.JApplet;

import letters.Config;
import letters.Server.controller.ServerController;

public class ServerBootstrap extends JApplet {

	private static final long serialVersionUID = -8975590910835922942L;

	public void init() {
		ServerController controller = new ServerController();
		Container container = getContentPane();
		container.add(controller.getView());
		setSize(Config.WINDOW_WIDTH,Config.WINDOW_HEIGHT);
		setVisible(true);
		controller.start();
	}
}
