package 
{
	import flash.display.Sprite;
	import flash.events.Event;

	public class Player extends Sprite
	{
		public static const NO_LIFES_LEFT:String = "NO_LIFES_LEFT";

		private var _name:String;
		// runtime vars
		private var _lifes:int;
		private var _credits:int;
		private var _highScore:int;
		public var randomBombAmount:int;
		public var timeBombAmount:int;

		// new round related vars (number between 0 and 7)
		public var lifesRank:int;
		public var creditMultRank:int;
		public var letterKillAmountRank:int;
		public var bombAmountRank:int;
		public var randomBombValueRank:int;
		public var timeBombValueRank:int;

		public function Player(name:String):void
		{
			_name = name;
			init();
		}

		private function init():void
		{
			lifesRank = 0;
			creditMultRank = 0;
			letterKillAmountRank = 0;
			bombAmountRank = 0;
			randomBombValueRank = 0;
			timeBombValueRank = 0;

			_lifes = Config.LIFES[lifesRank];
			_credits = 0;
			_highScore = 0;
			randomBombAmount = timeBombAmount = Config.BOMB_AMOUNT[bombAmountRank];
		}

		public function addCredits(credits:int):void
		{
			credits *=  Config.CREDITS[creditMultRank];
			_credits +=  credits;
			_highScore +=  credits;
		}

		public function addLifes(lifes:int):void
		{
			if (_lifes <= 0)
			{
				dispatchEvent(new Event(NO_LIFES_LEFT));
			} else {
				_lifes +=  lifes;
			}
		}

		public function getCredits():int
		{
			return _credits;
		}

		public function getLifes():int
		{
			return _lifes;
		}

		public function reset():void
		{
			_lifes = Config.LIFES[lifesRank];
			randomBombAmount = timeBombAmount = Config.BOMB_AMOUNT[bombAmountRank];
		}
	}
}