package 
{	
	import flash.utils.Dictionary;

	public class Config
	{
		/** game default values **/
		public static const GAME_BACKGROUND_PICTURE = "img/background3.jpg";
		public static const MENU_PICTURE = "img/menu.png";
		public static const GAME_BACKGROUND_SOUND = "sounds/Right Here, Right Now.mp3";
		public static const EXPLOSION_SOUND = new Array("sounds/explosion.mp3");
		
		/** GAME EVENTS **/
		public static const FREQUENCY = 0.07;
		public static const EVENT_FREQUENCY = 0.05;
		public static const POSITIVE_EVENT_FREQUENCY = 0.5;
		
		/** LETTERS **/
		public static const GERMAN = "de";
		public static const ENGLISH = "en";
		public static const DEFAULT_LANGUAGE = GERMAN;
		public static const POSITVE_COLOR = 0x33FF33;
		public static const NEGATIVE_COLOR = 0xFF3333;
		public static const DICT_URL = "xml/dictionary.xml";

		/** COUNTDOWN **/
		public static const GAME_TIME = 91000; // in milliseconds (90 seconds)
		
		/** SHOP **/
		public static const SHOP_BACKGROUND_SOUND = "sounds/Nujabes - 17.mp3";
		public static const SHOP_BACKGROUND_PICTURE = "img/background3.png";
		
		/** RANKS **/
		public static const LIFES = new Array(26,26+2,26+4,26+6,26+12,26+18,26+30,26+48);
		public static const CREDITS = new Array(1,2,4,8,16,32,64,128);
		public static const LETTER_KILL_AMOUNT = new Array(1,2,3,4,5,6,7,100);
		public static const BOMB_AMOUNT = new Array(0,1,2,3,5,8,12,20);
		public static const RANDOM_BOMBS = new Array(0,1,2,3,5,8,12,100);
		public static const TIME_BOMBS = new Array(1,0.9,0.75,0.6,0.45,0.3,0.15,0);
	}
}