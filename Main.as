package 
{
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.events.Event;

	public class Main extends Sprite
	{
		private var _container:Sprite;
		private var _player:Player;
		private var _shop:Shop;
		private var _game:Game;
		private var _gameBar:GameBar;

		public function Main():void
		{
			init();
		}

		private function init():void
		{
			_player = new Player("Bob");
			_gameBar = new GameBar(_player);
			_shop = new Shop(_player,_gameBar);
			_container = new Sprite  ;
			addChild(_container);
			
			startGame();
		}

		public function startGame():void
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN,onGamekeyDownHandler);
			_game = new Game(_player,_gameBar);
			_player.addEventListener(Player.NO_LIFES_LEFT,onNoLifesLeft);
			_game.addEventListener(Game.NO_TIME_LEFT,onNoTimeLeft);
			_container.addChild(_game);
			_game.startGame();
		}

		public function stopGame():void
		{
			_game.stopGame();
			_container.removeChild(_game);
			_game.removeEventListener(Game.NO_TIME_LEFT,onNoTimeLeft);
			_player.removeEventListener(Player.NO_LIFES_LEFT,onNoLifesLeft);
			stage.removeEventListener(KeyboardEvent.KEY_DOWN,onGamekeyDownHandler);
		}

		public function startShop():void
		{
			//_shop = new Shop(_player,_gameBar);
			_container.addChild(_shop);
			_shop.addEventListener(Shop.FINISHED_SHOPPING,onFinishedShopping);
			_shop.startShop();
		}

		public function onFinishedShopping(e:Event):void
		{
			_shop.stopShop();
			_container.removeChild(_shop);
			_shop.removeEventListener(Shop.FINISHED_SHOPPING,onFinishedShopping);
			startGame();
		}

		public function onNoLifesLeft(e:Event):void
		{
			stopGame();
			startShop();
		}

		public function onNoTimeLeft(e:Event):void
		{
			stopGame();
			startShop();
		}

		public function onGamekeyDownHandler(event:KeyboardEvent):void
		{
			/* [Shift] -> shop (später pause/menu) */
			if (event.keyCode == 16)
			{
				stopGame();
				startShop();
			}
			/* [Leertaste] -> random bomb */

			if (event.keyCode == 32)
			{
				_game.igniteRandomBomb();
			}
			/* [Strg] -> time bomb */

			if (event.ctrlKey)
			{
				_game.igniteTimeBomb();

			}
			/* [A]=65 [Z]=90 [Ä]=222 [Ü]=186 [Ö]=192 [ß]=219 */

			if (event.keyCode >= 65 && event.keyCode <= 90 || event.keyCode == 186 || event.keyCode == 192 || event.keyCode == 219 || event.keyCode == 222)
			{/** berechnet bei jedem tastendruck die punkte **/
				_game.computeCredits(event.charCode);
			}
		}
	}
}