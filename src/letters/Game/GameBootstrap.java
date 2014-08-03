package letters.Game;

import java.awt.Container;

import javax.swing.JApplet;

import letters.Config;
import letters.Game.controller.GameController;

public class GameBootstrap extends JApplet{

	private static final long serialVersionUID = -8563069427099007764L;
	
	/*public static void main(String[] args) {
		GameController controller = new GameController();
		JFrame frame = new JFrame("Letters");
		Container container = frame.getContentPane();
		container.add(controller.getView());
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setSize(Config.WINDOW_WIDTH,Config.WINDOW_HEIGHT);
		frame.setVisible(true);
		frame.setLocationRelativeTo(null); // zentrieren
		controller.start();
	}*/
	
	public void init() {
		GameController controller = new GameController();
		Container container = getContentPane();
		container.add(controller.getView());
		setSize(Config.WINDOW_WIDTH,Config.WINDOW_HEIGHT);
		setVisible(true);
		controller.start();
	} 
}