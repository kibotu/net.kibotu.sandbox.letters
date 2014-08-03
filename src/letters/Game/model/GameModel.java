package letters.Game.model;

import java.util.Collection;
import java.util.LinkedList;
import java.util.Random;

import letters.Config;
import letters.Game.view.Explosion;

public class GameModel {

	protected final Letters letters;
	protected final Score score;
	protected int respawnAmount;
	protected double respawnTime;
	protected Collection<Explosion> explosionList;

	public GameModel() {
		this.score = new Score();
		this.letters = new Letters(score);
		this.respawnAmount = Config.RESPAWN_AMOUNT;
		this.respawnTime = Config.RESPAWN_TIME;
		this.explosionList = new LinkedList<Explosion>();
	}
	
	public Collection<Explosion> getExplosions() {
		return explosionList;
	}

	public Letters getLetters() {
		return letters;
	}

	public void addLetters() {
		for (int i = 0; i < new Random().nextInt(respawnAmount); i++) {
			letters.addLetter();
		}
	}

	public void moveAllLetters() {
		letters.moveAll();
	}

	public int getRespawnAmount() {
		return respawnAmount;
	}

	public void increaseRespawnTime(double respawnTime) {
		this.respawnTime += respawnTime;
	}

	public void decreaseRespawnTime(double respawnTime) {
		this.respawnTime -= respawnTime;
	}

	public double getRespawnTime() {
		return respawnTime;
	}

	public String toString() {
		return "Respawn Time: " + respawnTime + " | Respawn Amount: " + respawnAmount;
	}

	public boolean hasLifes() {
		return score.hasLifes();
	}

	public boolean computeScore(char input) {
		Collection<Letter> lettersToExplode = new LinkedList<Letter>();
		lettersToExplode.addAll(letters.computeScore(input));
		if(lettersToExplode.isEmpty()) {
			return false;
		}
		for (Letter letter: lettersToExplode) {
			explosionList.add(new Explosion (letter.getPosition()));
			Explosion.playSound();
		}
		return true;
	}

	public int getLifes() {
		return score.getLifes();
	}

	public int getScore() {
		return score.getScore();
	}

	public void clearExplosionList() {
		explosionList.clear();		
	}

	public void removeExplosion(Explosion explosion) {
		explosionList.remove(explosion);		
	}

	public void increaseExplosionFrames() {
		Collection<Explosion> explosionsToRemove = new LinkedList<Explosion>();
		for(Explosion explosion: explosionList) {
			if(explosion.isRunning()) {
				explosion.increaseFrame();
			} else {
				explosionsToRemove.add(explosion);
			}
		}
		explosionList.removeAll(explosionsToRemove);		
	}
}
