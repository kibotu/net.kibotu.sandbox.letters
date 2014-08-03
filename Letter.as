package 
{
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.text.AntiAliasType;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.filters.DropShadowFilter;

	public class Letter extends MovieClip
	{
		private var _text:TextField;
		private var _asset:MovieClip;
		private var _color:Number;
		private var _size:Number;
		private var _creditValue:Number;

		public var xPos:Number;
		public var yPos:Number;
		public var flySpeedX:Number;
		public var flySpeedY:Number = 0;

		public function Letter(letter:String="",dx:Number=-20,dy:Number=-9999,speedX:Number=-9999,creditValue:Number=1,color:Number=0x000000,size:Number=12):void
		{
			if (letter == "")
			{
				letter = getRandomLetter();
			}
			if (speedX == -9999)
			{
				speedX = Math.random() * 6 + 1;
			}
			xPos = dx;
			if (dy == -9999)
			{
				dy = Math.random() * 400 + 1 + 60;
			}
			yPos = dy - speedX;
			var format:TextFormat = new TextFormat  ;
			format.color = _color = color;
			format.size = _size = size + 3 / 2 * speedX;
			//format.font = new Calibri().fontName;
			_text = new TextField  ;
			_text.defaultTextFormat = format;
			flySpeedX = speedX;
			_creditValue = creditValue;
			_text.text = letter;
			init();
		}

		private function init():void
		{
			_text.selectable = false;
			_text.autoSize = TextFieldAutoSize.CENTER;
			_text.antiAliasType = AntiAliasType.ADVANCED;
			_asset = new MovieClip  ;
			addChild(_asset);
			_asset.addChild(_text);
			x = xPos;
			y = yPos;
			mouseChildren = false;
		}

		public function getColor():Number
		{
			return _color;
		}

		public static function getRandomLetter():String
		{
			return String.fromCharCode(64 + Math.random() * 25 + 1);
		}

		public function isKey(key:Number):Boolean
		{
			return _text.text.charCodeAt(0) == key - 32;
		}

		public function getWidth():Number
		{
			return _text.width;
		}

		public function getHeight():Number
		{
			return _text.height;
		}

		public function getCreditValue():Number
		{
			return _creditValue;
		}

		public function addSpeed(dx:Number):void
		{
			flySpeedX *=  dx;
		}

		public function getDropShadow(distance:Number=5,angle:Number=25,alpha:Number=0.5,blurX:Number=10,blurY:Number=10):DropShadowFilter
		{
			var shadow:DropShadowFilter = new DropShadowFilter  ;
			shadow.distance = distance;
			shadow.angle = angle;
			shadow.alpha = alpha;
			shadow.blurX = blurX;
			shadow.blurY = blurY;
			return shadow;
		}

		public function getLetter():String
		{
			return _text.text;
		}
	}
}