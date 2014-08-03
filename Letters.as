package {
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.Dictionary;	
	import flash.net.URLLoader;	
	import flash.net.URLRequest;	
	
	public class Letters extends Sprite {
		
		private var _container:Sprite;		
		private var _availableLetters:Dictionary;
		private var _letters:LinkedList;		

		private var _wordSize:Number;
		private var _creditFactor:Number;
		private var _wordFactor:Number;
		private var _wordHandicap:Number;
		
		private var _xml:XML;
		
		public static const HIT_BORDER = "HIT_BORDER";
		
		public function Letters():void {
			init();
		}
		
		private function init():void {
			_container = new Sprite();
			_availableLetters = new Dictionary();
			_letters = new LinkedList();		
			
			_wordSize = 12;
			_wordFactor = 10;
			_creditFactor = 10;
			_wordHandicap = -10;
			
			_xml = new XML  ;
			
			addChild(_container);
			setAvailableLetters();
			loadXml();
		}
		
		public function setAvailableLetters():void {
			for(var i:int = 65; i < 91; ++i) {
				_availableLetters[String.fromCharCode(i)] = 0;
			}		
		}
				
		public function computeCredits(key:int, amount:int):int {
			var credits:int = 0;
			var removedLetters:int = 0;
			var toRemove:Array = new Array();
			
			for (var i:int = 0; i < _letters.size(); ++i)
			{
				var letter:Letter = _letters.get(i) as Letter;
				if (letter.isKey(key))
				{
					toRemove.push(letter);
				}
			}
			
			toRemove.sortOn("x", Array.NUMERIC | Array.DESCENDING);
			
			for(i = 0; i < toRemove.length; ++i) {
				if (removedLetters >= amount)
				{
					break;
				}
				credits +=  letter.getCreditValue();
				removeLetter(toRemove[i]);
				removedLetters++;
			}
			
			return credits;
		}
		
		/** LETTERS **/
		public function addLetter(element:String="",dx:Number=-20,dy:Number=-9999,speed:Number=-9999,creditValue:Number=1,color:Number=0x000000,size:Number=12):void
		{
			if (element == "")
			{
				/*while (letterInList(_lettersBlackList,element))
				{
					element = Letter.getRandomLetter();
				}**/
			}
			var letter:Letter = new Letter(element,dx * 3,dy,speed,creditValue,color,size);
			_container.addChild(letter);
			_letters.add(letter);
		}

		private function letterInList(list:LinkedList,letter:String):Boolean
		{
			for (var i:int; i < list.size(); ++i)
			{
				if (Letter(list.get(i)).getLetter() == letter)
				{
					return true;
				}
			}
			return false;
		}

		public function addBadLetter():void
		{
			var letter:Letter = new Letter(Letter.getRandomLetter(),-20,Math.random() * 380 + 1 + 100,Math.random() * 6 - 1,_wordHandicap,Config.NEGATIVE_COLOR,12);
//			_lettersBlackList.add(letter);
			_container.addChild(letter);
		}

		public function moveLetters():void
		{
			for (var i:int; i < _letters.size(); i++)
			{
				var element:Letter = _letters.get(i) as Letter;
				element.xPos +=  element.flySpeedX;
				element.x = element.xPos;

				// rand erreicht? ja: punkt abzug und buchstaben entfernen
				if (element.x > 800 - element.getWidth() * 4)
				{
					removeLetter(element);
					dispatchEvent(new Event(Letters.HIT_BORDER));
				}
			}
		}

		public function removeLetter(letter:Letter):void
		{
			Explosion.explosion(_container, letter.xPos + 60,letter.yPos + 10,50-int(Math.sqrt(_letters.size())),20-int(Math.sqrt(_letters.size())),50,letter.getColor());
			_container.removeChild(letter);
			_letters.remove(letter);
		}

		private function removeAllLetter():void
		{
			for (var i:int; i < _letters.size(); i++)
			{
				_container.removeChild(_letters.get(i) as Letter);
			}
			_letters.clear();
		}
		
		public function size():int {
			return _letters.size();
		}
		
		public function get(index:int):Letter {
			return _letters.get(index) as Letter;
		}

		/** WORDS **/
		public function addWord(word:String=""):void
		{
			word = word == "" ? getRandomWord().toLocaleUpperCase():word;
			var dy:int = Math.random() * 300 + 1 + 100;
			var speed:int = Math.random() * 3 + 1;
			var wordLength = 6;
			for (var i:int = 0; i < word.length; ++i)
			{
				addLetter(word.charAt(word.length - 1 - i), -  wordLength * i + 1 - 20,dy,speed,_wordFactor,Config.POSITVE_COLOR,_wordSize + 2 / 3 * speed);
			}
		}

		private function getRandomWord():String
		{
			return Config.DEFAULT_LANGUAGE == "de" ? _xml.word[int(Math.random() * _xml.word.length())]. @ ger:_xml.word[int(Math.random() * _xml.word.length())]. @ en;
		}
		
		/** XML DICTIONARY **/
		private function loadXml():void
		{
			var loader:URLLoader = new URLLoader  ;
			loader.addEventListener(Event.COMPLETE,onXmlLoadComplete);
			loader.load(new URLRequest(Config.DICT_URL));
		}

		private function onXmlLoadComplete(e:Event):void
		{
			_xml = new XML(e.target.data);
		}
	}
}