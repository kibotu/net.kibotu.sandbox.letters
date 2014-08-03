package letters.Game.model;

import letters.Config;

public class Score {

	protected int score;
	protected int lifes;

	public Score() {
		this.score = Config.SCORE;
		this.lifes = Config.LIFES;
	}

	public void increase(int score) {
		this.score += score;
		if ((this.score % Config.BONUS_LIFE_EVERY_POINTS) == 0) {
			lifes++;
		}
	}

	public void decreaseLifes(int score) {
		this.lifes--;
	}

	public boolean hasLifes() {
		return (lifes >= 1);
	}

	public String toString() {
		return "Punkte: " + score + " | Leben: " + lifes;
	}

	public int getScore() {
		return score;
	}

	public int getLifes() {
		return lifes;
	}
}
