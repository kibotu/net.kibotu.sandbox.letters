package letters.Game.controller;

import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;

import javax.swing.JPanel;

import letters.Game.model.GameModel;
import letters.Game.view.GameView;

public class GameController implements Runnable, KeyListener {

	GameView view;
	GameModel model;
	
	boolean playSound = false;

	public GameController() {
		this.model = new GameModel();
		this.view = new GameView(model);
		view.addKeyListener(this);
		view.setFocusable(true);
	}

	@Override
	public void run() {
		Thread.currentThread().setPriority(Thread.MIN_PRIORITY);

		double startTime = System.currentTimeMillis();

		while (true) {

			if( !model.hasLifes() ) {
				return;
			}
			
			/** add letters **/
			double runTime = System.currentTimeMillis() - startTime;
			if (runTime >= model.getRespawnTime()) {
				model.addLetters();
				startTime = System.currentTimeMillis();
			}

			/** increase explosion frame **/
			model.increaseExplosionFrames();
			
			/** move letters **/
			model.moveAllLetters();			
			
			/** repaint **/
			view.repaint();
			
			/** sleep **/
			try {
				Thread.sleep(20);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			Thread.currentThread().setPriority(Thread.MAX_PRIORITY);
		}
	}

	public JPanel getView() {
		return view;
	}

	public void start() {
		Thread thread = new Thread(this);
		thread.start();
	}

	@Override
	public void keyTyped(KeyEvent e) {
		// TODO Auto-generated method stub
	}

	@Override
	public void keyPressed(KeyEvent e) {

		char input = Character.toUpperCase(e.getKeyChar());

		if (e.getKeyCode() == KeyEvent.VK_RIGHT) {
		} else if (e.getKeyCode() == KeyEvent.VK_LEFT) {
		} else if (e.getKeyCode() == KeyEvent.VK_UP) {
		} else if (e.getKeyCode() == KeyEvent.VK_DOWN) {
		} else if (range(input)) {
			model.computeScore(input);
		} else {
//			System.out.println(e.toString());
		}
	}

	private boolean range(char upperCase) {
		return (upperCase >= 'A' && upperCase <= 'Z');
	}

	@Override
	public void keyReleased(KeyEvent e) {
		// TODO Auto-generated method stub
	}
}
