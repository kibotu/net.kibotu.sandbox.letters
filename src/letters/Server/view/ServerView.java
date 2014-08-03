package letters.Server.view;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Insets;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JComponent;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import letters.Config;

import letters.Command;

public class ServerView extends JPanel {

	private static final long serialVersionUID = 1149451280791053202L;

	protected final JLabel headline;
	protected final JButton host;
	protected final JButton connect;
	protected final JLabel waiting;
	protected final JLabel ip;
	protected final JTextField ipToEnter;
	protected final JButton submitIp;
	protected final ActionListener actionListener;

	public ServerView(ActionListener actionListener) {
		super();
		setLayout(null);
		setBackground(Color.WHITE);
		this.actionListener = actionListener;

		/** creating **/
		headline = new JLabel("<html><h1>Letters</h1></html>");
		host = new JButton("Host");
		host.setActionCommand(Command.HOST_GAME.toString());
		connect = new JButton("Connect");
		connect.setActionCommand(Command.CONNECT_TO_GAME.toString());
		waiting = new JLabel(
				"<html><h3><i>Waiting for Player to connect...</i></h3></html>");
		ip = new JLabel("IP:");
		ipToEnter = new JTextField(Config.DEFAULT_IP);
		ipToEnter.addActionListener(this.actionListener);
		submitIp = new JButton("Connect");
		submitIp.setActionCommand(Command.SUBMIT_IP.toString());
		submitIp.addActionListener(this.actionListener);

		/** add listeners **/
		host.addActionListener(this.actionListener);
		connect.addActionListener(this.actionListener);

		addButtons();
	}

	public void addButtons() {
		/** adding **/
		add(headline);
		add(host);
		add(connect);

		/** positioning **/
		setPosition(headline, 400, 50, 0, 0);
		setPosition(host, 250, 200, 50, 50);
		setPosition(connect, 500, 200, 50, 50);
	}

	public void setPosition(JComponent element, int dx, int dy, int width,
			int height) {
		Dimension size = element.getPreferredSize();
		Insets insets = getInsets();
		element.setBounds(insets.left + dx, insets.top + dy,
				size.width + width, size.height + height);
	}

	public void showWaitingForPlayer() {
		removeAll();
		repaint();

		add(waiting);
		setPosition(waiting, 350, 200, 0, 0);
	}

	public void showConnect() {
		removeAll();
		repaint();

		add(ip);
		add(ipToEnter);
		add(submitIp);

		setPosition(ip, 300, 200, 50, 0);
		setPosition(ipToEnter, 350, 200, 50,0);
		setPosition(submitIp, 500, 200, 0, 0);
	}

	public void showWaitingForServer() {
		removeAll();
		repaint();

		add(waiting);
		setPosition(waiting, 350, 200, 0, 0);
	}
}