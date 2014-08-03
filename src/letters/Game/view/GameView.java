package letters.Game.view;

import java.awt.BorderLayout;
import javax.swing.JPanel;
import letters.Game.model.GameModel;

public class GameView extends JPanel{

	private static final long serialVersionUID = -6479967695705623885L;
	
	public GameView(GameModel model) {
		super();
		setLayout(new BorderLayout());
		Status status = new Status(model);
		add(status, BorderLayout.NORTH);
		add(new GameCanvas(model, status), BorderLayout.CENTER);
	}
}
