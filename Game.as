package 
{
	import flash.display.Sprite;
	import flash.events.Event;

	public class Game extends Sprite
	{
		private var _container:Sprite;
		private var _player:Player;
		private var _menu:GameBar;
		private var _letters:Letters;
		private var _currentTime:Number;
		public static const NO_TIME_LEFT = "NO_TIME_LEFT";

		public function Game(player:Player,gameBar:GameBar):void
		{
			_player = player;
			_menu = gameBar;
			init();
		}

		private function init():void
		{
			_container = new Sprite  ;
			_letters = new Letters  ;
			var d:Date = new Date  ;
			_currentTime = d.getTime();
		}

		public function startGame():void
		{
			addChild(_container);
			Pictures.showPicture(_container,Config.GAME_BACKGROUND_PICTURE);
			_container.addChild(_menu);
			_container.addChild(_letters);
			_letters.addEventListener(Letters.HIT_BORDER,onHitBorder);
			addEventListener(Event.ENTER_FRAME,onEnterFrame);
			Sounds.play(Config.GAME_BACKGROUND_SOUND);
		}

		public function stopGame():void
		{
			Sounds.stop();
			_letters.removeEventListener(Letters.HIT_BORDER,onHitBorder);
			removeEventListener(Event.ENTER_FRAME,onEnterFrame);
			_container.removeChild(_menu);
		}

		public function computeCredits(key:Number):void
		{
			var credits:int = _letters.computeCredits(key,Config.LETTER_KILL_AMOUNT[_player.letterKillAmountRank]);
			if (credits == 0)
			{
				_player.addLifes(-1);
				_menu.life.text = _player.getLifes().toString();
			}
			else
			{
				_player.addCredits(credits);
				_menu.credit.text = _player.getCredits().toString();
			}
		}

		/** RANDOM BOMB **/
		public function igniteRandomBomb():void
		{
			if (_player.randomBombAmount < 1)
			{
				return;
			}
			var toRemove:int = Config.RANDOM_BOMBS[_player.randomBombValueRank] >= _letters.size() ? _letters.size():Config.RANDOM_BOMBS[_player.randomBombValueRank];
			for (var i:int; i < toRemove; ++i)
			{
				var randomLetterIndex:int = Math.random() * _letters.size() - 1;
				var letter:Letter = _letters.get(randomLetterIndex);
				_player.addCredits(letter.getCreditValue());
				_letters.removeLetter(letter);
			}
			_player.randomBombAmount--;
			_menu.randomBomb.text = _player.randomBombAmount.toString();
			_menu.credit.text = _player.getCredits().toString();
		}

		/** TIME BOMB **/
		public function igniteTimeBomb():void
		{
			if (_player.timeBombAmount < 1)
			{
				return;
			}
			for (var i:int; i < _letters.size(); ++i)
			{
				_letters.get(i).addSpeed(Config.TIME_BOMBS[_player.timeBombValueRank]);
			}
			_player.timeBombAmount--;
			_menu.timeBomb.text = _player.timeBombAmount.toString();
		}

		/** COUNTDOWN TIMER **/
		public function getCountdown(time:Number=Config.GAME_TIME):String
		{
			var today:Date = new Date  ;
			var curTime = today.getTime();
			var myRetirement:Date = new Date(_currentTime + time);
			var myRetirementTime = myRetirement.getTime();
			var timeLeft = myRetirementTime - curTime;
			var seconds = Math.floor(timeLeft / 1000);
			var minutes = Math.floor(seconds / 60);
			seconds = String(seconds % 60);
			seconds = seconds.length < 2 ? "0" + seconds:seconds;
			minutes = String(minutes % 60);
			if (minutes <= 0 && seconds <= 0)
			{
				dispatchEvent(new Event(Game.NO_TIME_LEFT));
			}
			return minutes + ":" + seconds;
		}

		public function updateTimer():void
		{
			_menu.stopWatch.text = getCountdown();
		}

		/** MAIN EVENT **/
		private function onEnterFrame(e:Event):void
		{
			if (Math.random() < Config.FREQUENCY)
			{
				if (Math.random() < Config.EVENT_FREQUENCY)
				{
					if (Math.random() < Config.POSITIVE_EVENT_FREQUENCY)
					{
						_letters.addWord();
					}
					else
					{
						_letters.addBadLetter();
					}
				}
				else
				{
					_letters.addLetter();
				}
			}
			_letters.moveLetters();
			updateTimer();
		}

		private function onHitBorder(e:Event):void
		{
			_player.addLifes(-1);
			_menu.life.text = _player.getLifes().toString();
		}
	}
}