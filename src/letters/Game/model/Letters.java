package letters.Game.model;

import java.awt.Graphics;
import java.util.Collection;
import java.util.LinkedList;

public class Letters {

	private static final long serialVersionUID = -7291054653465586513L;
	protected final Collection<Letter> letters;
	protected final Score score;

	public Letters(Score score) {
		this.letters = new LinkedList<Letter>();
		this.score = score;
	}

	public void addLetter() {
		letters.add(new Letter());
	}

	public void moveAll() {
		Collection<Letter> lettersToRemove = new LinkedList<Letter>();
		for (Letter letter : letters) {
			if (!letter.translate(1, 0)) {
				score.decreaseLifes(1);
				lettersToRemove.add(letter);
			}
		}
		letters.removeAll(lettersToRemove);
	}

	public void draw(Graphics g) {
		for (Letter letter : letters) {
			letter.draw(g);
		}
	}

	public Collection<Letter> computeScore(char input) {
		Collection<Letter> scoredLetter = new LinkedList<Letter>();
		for (Letter letter : letters) {
			if (letter.getLetter() == input) {
				scoredLetter.add(letter);
			}
		}
		if (scoredLetter.isEmpty()) {
			score.decreaseLifes(1);
		} else {
			letters.removeAll(scoredLetter);
			score.increase(scoredLetter.size());
		}
		return scoredLetter;
	}
}
