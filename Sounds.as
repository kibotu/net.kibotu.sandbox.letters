package {	
	import flash.media.SoundMixer;
	import flash.media.Sound;
	import flash.display.MovieClip;
	import flash.net.URLRequest;
	import flash.display.Sprite;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	
	public class Sounds extends Sprite{
		
		public static function play(filename:String):void
		{
			// var trans:SoundTransform = 
			var sound:Sound = new Sound();
			sound.load(new URLRequest(filename));
			sound.play();
		}
		
		public static function stop():void {
			SoundMixer.stopAll();
		}
	}
}