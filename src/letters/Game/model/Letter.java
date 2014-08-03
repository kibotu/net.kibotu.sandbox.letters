package letters.Game.model;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.Point;
import java.util.Random;

import letters.Config;

public class Letter {
	protected Color color;
	protected int radius;
	protected Point position;
	protected final char letter;
	protected double speed;

	public Letter() {
		this.color = Color.RED;
		this.radius = 10;
		this.position = new Point(-radius,new Random().nextInt(Config.WINDOW_HEIGHT - 100));
		this.letter = getRandomLetter();
		this.speed = new Random().nextInt(4);
	}

	public char getRandomLetter() {
		return (char) ('A' + new Random().nextInt(26));
	}

	public boolean translate(int dx, int dy) {
		position.translate((int) (dx * speed), dy);
		return (position.getX() <= Config.WINDOW_WIDTH) ? true : false;
	}

	public void draw(Graphics g) {
		Color oldColor = g.getColor();
		g.setColor(color);
		g.drawChars(new char[] { letter }, 0, 1, (int) position.getX(),	(int) position.getY() + radius);
		g.setColor(oldColor);
	}

	public Point getPosition() {
		return position;
	}

	public Color getColor() {
		return color;
	}

	public void setColor(Color color) {
		this.color = color;
	}

	public int getRadius() {
		return radius;
	}

	public char getLetter() {
		return letter;
	}

	public void setSpeed(double speed) {
		this.speed = speed;
	}

	public String toString() {
		return "X: " + position.getX() + "| Y: " + position.getY()
				+ " | Speed: " + speed;
	}
}