package letters;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

final public class Config {

	public final static int WINDOW_WIDTH = 900;
	public final static int WINDOW_HEIGHT = 400;
	public final static int RESPAWN_AMOUNT = 4;
	public final static double RESPAWN_TIME = 300;
	public final static int SCORE = 0;
	public final static int LIFES = 25;
	public final static int BONUS_LIFE_EVERY_POINTS = 10;
	public final static int ANZAHL_FRAMES = 25;
	public final static BufferedImage[] EXPLOSION_IMAGES = getExplosionImage(); 
	public final static String DEFAULT_IP = "127.0.0.1";

	private Config() {
	}

	private static BufferedImage[] getExplosionImage() {
		BufferedImage[] image = new BufferedImage[ANZAHL_FRAMES];
		try {
			for (int i = 0; i < ANZAHL_FRAMES; i++) {
				image[i] = ImageIO.read(ClassLoader.getSystemResourceAsStream("frame" + (i + 1) + ".png"));
			}
		} catch (IOException ex) {
			System.err.println(ex.getMessage());
		}

		return image;
	}
}
