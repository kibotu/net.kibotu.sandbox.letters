package letters.Game.view;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.Point;
import java.io.File;

import javax.sound.sampled.AudioFormat;
import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.Clip;
import javax.sound.sampled.DataLine;

import letters.Config;

public class Explosion {

	protected final Point position;
	protected final Image[] image;
	protected int frame;
	protected boolean running;

	public Explosion(Point position) {
		this.position = position;
		image = Config.EXPLOSION_IMAGES;
		frame = 0;
		running = true;
	}

	public void draw(Graphics g) {
		g.drawImage(image[frame], (int) position.getX() - 30,
				(int) position.getY() - 40, null);
		// g.fill3DRect((int)position.getX(), (int)position.getY(), 10, 10,
		// true);
	}

	public void increaseFrame() {
		if (frame > Config.ANZAHL_FRAMES - 2) {
			running = false;
		} else {
			frame++;
		}
	}

	public boolean isRunning() {
		return running;
	}

	public static void playSound() {

		AudioInputStream audioInputStream = null;
		try {
            audioInputStream = AudioSystem.getAudioInputStream(ClassLoader.getSystemResourceAsStream("explosion.wav"));
			AudioFormat af = audioInputStream.getFormat();
			int size = (int) (af.getFrameSize() * audioInputStream
					.getFrameLength());
			byte[] audio = new byte[size];
			DataLine.Info info = new DataLine.Info(Clip.class, af, size);
			audioInputStream.read(audio, 0, size);

			// for(int i=0; i < 32; i++) {
			Clip clip = (Clip) AudioSystem.getLine(info);
			clip.open(af, audio, 0, size);
			clip.start();
			// }
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
