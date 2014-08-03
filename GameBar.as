package 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.AntiAliasType;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.display.BlendMode;
	import flash.display.Loader;
	import flash.net.URLRequest;

	public class GameBar extends Sprite
	{
		private var _container:Sprite;
		private var _player:Player;
		public var life:TextField;
		public var credit:TextField;
		public var stopWatch:TextField;
		public var randomBomb:TextField;
		public var timeBomb:TextField;

		public function GameBar(player:Player):void
		{
			_player = player;
			init();
		}

		private function init():void
		{
			_container = new Sprite  ;
			addChild(_container);
			life = new TextField  ;
			credit = new TextField  ;
			stopWatch = new TextField  ;
			randomBomb = new TextField  ;
			timeBomb = new TextField  ;
			addTextFields();
			Pictures.showPicture(_container,Config.MENU_PICTURE,BlendMode.MULTIPLY,25,5);
			update();
		}

		public function update():void
		{
			credit.text = _player.getCredits().toString();
			life.text = _player.getLifes().toString();
			timeBomb.text = _player.timeBombAmount.toString();
			randomBomb.text = _player.randomBombAmount.toString();
		}

		private function addTextFields():void
		{
			var format:TextFormat = new TextFormat  ;
			format.size = 32;
			format.color = 0x0A0A0A;
			//format.font = new Calibri().fontName;

			life.defaultTextFormat = credit.defaultTextFormat = stopWatch.defaultTextFormat = randomBomb.defaultTextFormat = timeBomb.defaultTextFormat = format;
			life.x = 100;
			//life.embedFonts = true;
			credit.x = 200;
			stopWatch.x = 350;
			randomBomb.x = 500;
			timeBomb.x = 600;
			life.y = credit.y = stopWatch.y = randomBomb.y = timeBomb.y = 8;
			//life.border = credit.border = stopWatch.border = true;
			life.selectable = credit.selectable = stopWatch.selectable = randomBomb.selectable = timeBomb.selectable = false;
			life.autoSize = credit.autoSize = stopWatch.autoSize = randomBomb.autoSize = timeBomb.autoSize = TextFieldAutoSize.CENTER;
			life.antiAliasType = credit.antiAliasType = stopWatch.antiAliasType = randomBomb.antiAliasType = timeBomb.antiAliasType = AntiAliasType.ADVANCED;
			//life.filters = credit.filters = stopWatch.filters = [getDropShadow()];

			_container.addChild(life);
			_container.addChild(credit);
			_container.addChild(stopWatch);
			_container.addChild(randomBomb);
			_container.addChild(timeBomb);
		}
	}
}