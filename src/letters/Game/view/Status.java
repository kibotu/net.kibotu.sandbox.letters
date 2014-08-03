package letters.Game.view;

import java.awt.Dimension;
import javax.swing.JLabel;
import javax.swing.JTextPane;

import letters.Config;
import letters.Game.model.GameModel;

public class Status extends JTextPane {

	private static final long serialVersionUID = -8086742084651999485L;
	protected JLabel label;

	public Status(GameModel model) {
		super();
		setText("Leben " + Config.LIFES + " | Score: " + Config.SCORE);
		setPreferredSize(new Dimension(500, 50));
		setContentType("text/html");
		setFocusable(false);
	}

	public void setStatus(String text) {
		setText(text);
	}
}