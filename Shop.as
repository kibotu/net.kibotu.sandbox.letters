package 
{
	import flash.display.Sprite;
	import flash.display.BlendMode;
	import flash.net.URLRequest;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	import flash.utils.Dictionary;
	import flash.display.SimpleButton;

	public class Shop extends Sprite
	{
		private var _player:Player;
		private var _container:Sprite;
		private var _buttons:Dictionary;
		private var _elements:Array;
		private var _menu:GameBar;

		public static const FINISHED_SHOPPING = "FINISHED_SHOPPING";

		public function Shop(player:Player,gameBar:GameBar):void
		{
			_player = player;
			_menu = gameBar;
			init();
		}

		private function init():void
		{
			_container = new Sprite  ;
			_buttons = new Dictionary  ;
			_elements = new Array  ;
			Pictures.showPicture(this,Config.SHOP_BACKGROUND_PICTURE);
			Pictures.showPicture(this,Config.MENU_PICTURE,BlendMode.MULTIPLY,25,5);
		}

		public function startShop():void
		{
			addChild(_container);
			_container.addChild(_menu);
			_player.reset();
			_menu.stopWatch.text = "Shop";
			addBars();
			addSubmitButton();
			Sounds.play(Config.SHOP_BACKGROUND_SOUND);
		}

		public function stopShop():void
		{
			_container.removeChild(_menu);
			removeChild(_container);
			Sounds.stop();
		}

		private function addBars():void
		{
			addBar("life",75,5 + 70,new UpgradeLifes  ,_player.lifesRank).addEventListener(MouseEvent.CLICK,onBuyLife);
			addBar("creditMultiplicator",75,5 + 70 * 2,new UpgradeLifes  ,_player.creditMultRank).addEventListener(MouseEvent.CLICK,onBuyCreditMultiplicator);
			addBar("letterAmount",75,5 + 70 * 3,new UpgradeLifes  ,_player.letterKillAmountRank).addEventListener(MouseEvent.CLICK,onBuyLetterKillAmount);
			addBar("bombAmount",75,5 + 70 * 4,new UpgradeBomb  ,_player.bombAmountRank).addEventListener(MouseEvent.CLICK,onBuyBombAmount);
			addBar("randomBombValue",75,5 + 70 * 5,new UpgradeRandomBomb  ,_player.randomBombValueRank).addEventListener(MouseEvent.CLICK,onBuyRandomBombValue);
			addBar("timeBombValue",75,5 + 70 * 6,new UpgradeTimeBomb  ,_player.timeBombValueRank).addEventListener(MouseEvent.CLICK,onBuyTimeBombValue);
		}

		private function reset():void
		{
			removeChild(_container);
			_container = new Sprite  ;
			_container.addChild(_menu);
			addChild(_container);
			addBars();
			addSubmitButton();
		}

		private function onBuyLife(e:Event):void
		{
			if (_player.lifesRank < 7)
			{
				_player.lifesRank++;
				_player.reset();
				_menu.update();
			}
			e.target.removeEventListener(MouseEvent.CLICK,onBuyLife);
			reset();
		}

		private function onBuyCreditMultiplicator(e:Event):void
		{
			if (_player.creditMultRank < 7)
			{
				_player.creditMultRank++;
				_player.reset();
				_menu.update();
			}
			e.target.removeEventListener(MouseEvent.CLICK,onBuyCreditMultiplicator);
			reset();
		}

		private function onBuyLetterKillAmount(e:Event):void
		{
			if (_player.letterKillAmountRank < 7)
			{
				_player.letterKillAmountRank++;
				_player.reset();
				_menu.update();
			}
			e.target.removeEventListener(MouseEvent.CLICK,onBuyLetterKillAmount);
			reset();
		}

		private function onBuyBombAmount(e:Event):void
		{
			if (_player.bombAmountRank < 7)
			{
				_player.bombAmountRank++;
				_player.reset();
				_menu.update();
			}
			e.target.removeEventListener(MouseEvent.CLICK,onBuyBombAmount);
			reset();
		}

		private function onBuyRandomBombValue(e:Event):void
		{
			if (_player.randomBombValueRank < 7)
			{
				_player.randomBombValueRank++;
				_player.reset();
				_menu.update();
			}
			e.target.removeEventListener(MouseEvent.CLICK,onBuyRandomBombValue);
			reset();
		}

		private function onBuyTimeBombValue(e:Event):void
		{
			if (_player.timeBombValueRank < 7)
			{
				_player.timeBombValueRank++;
				_player.reset();
				_menu.update();
			}
			e.target.removeEventListener(MouseEvent.CLICK,onBuyTimeBombValue);
			reset();
		}

		private function addBar(barname:String,dx:int,dy:int,clip:MovieClip,value:Number):SimpleButton
		{
			var button:SimpleButton = new SimpleButton  ;
			button.upState = clip;
			button.overState = clip;
			button.downState = clip;
			button.hitTestState = clip;
			button.useHandCursor = true;
			button.width = 50;
			button.height = 50;
			button.x = dx;
			button.y = dy;
			_buttons[barname] = button;
			_container.addChild(button);
			addStar(dx + 75,dy,value);
			addSpheres(dx + 75,dy,7 - value);
			return button;
		}

		private function addStar(dx:int,dy:int,amount):void
		{
			for (var i:int = 0; i < amount; ++i)
			{
				var star:MovieClip = new Star  ;
				star.x = dx + 80 * i;
				star.y = dy;
				star.width = 50;
				star.height = 50;
				_container.addChild(star);
				_elements.push(star);
			}
		}

		private function addSpheres(dx:int,dy:int,amount):void
		{
			for (var i:int = 0; i < amount; ++i)
			{
				var sphere:MovieClip = new Sphere  ;
				sphere.x = 480 + dx + 15 - 80 * i;
				sphere.y = dy + 20;
				sphere.width = 20;
				sphere.height = 20;
				_container.addChild(sphere);
				_elements.push(sphere);
			}
		}

		private function addSubmitButton():void
		{
			var submit:MovieClip = new Submit  ;
			submit.x = 670;
			submit.y = 420;
			submit.addEventListener(MouseEvent.CLICK,onClick);
			_container.addChild(submit);
		}

		private function onClick(e:Event):void
		{
			Sounds.stop();
			_player.reset();
			dispatchEvent(new Event(FINISHED_SHOPPING));
			e.target.removeEventListener(MouseEvent.CLICK,onClick);
		}
	}
}