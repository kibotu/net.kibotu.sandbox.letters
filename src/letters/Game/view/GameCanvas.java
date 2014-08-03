package letters.Game.view;

import java.awt.Color;
import java.awt.Graphics;
import javax.swing.JPanel;

import letters.Game.model.GameModel;

public class GameCanvas extends JPanel {

	private static final long serialVersionUID = -993399279594202593L;
	protected final Status status;
	protected final GameModel model;
	protected double runTime;

	public GameCanvas(GameModel model, Status status) {
		super();
		setBackground(Color.WHITE);
		this.model = model;
		this.status = status;
		this.runTime = System.currentTimeMillis();
	}

	@Override
	public void paintComponent(Graphics g) {
		super.paintComponent(g);
		for (Explosion explosion : model.getExplosions()) {
			explosion.draw(g);
		}
		model.getLetters().draw(g);
		status.setText("<html><body><center>Leben: <b>" + model.getLifes()
				+ "</b> Punkte: <b>" + model.getScore()
				+ "</b></center></body></html>");
	}
}