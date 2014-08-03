package {
	
	import flash.net.URLLoader;	
	import flash.net.URLRequest;	
	import flash.display.Loader;
	import flash.display.BlendMode;
	import flash.display.Loader;
	import flash.display.Sprite;
	
	public class Pictures extends Sprite {
		
		public static function showPicture(container:Sprite, filename:String,blendmode:String=BlendMode.NORMAL,dx:Number=0,dy:Number=0):void
		{
			var imgLoader:Loader = new Loader  ;
			//imgLoader.contentLoaderInfo.addEventListner(Event.COMPLETE,loaderCompleteHandler);
			imgLoader.load(new URLRequest(filename));
			imgLoader.blendMode = blendmode;
			imgLoader.x = dx;
			imgLoader.y = dy;
			container.addChild(imgLoader);
		}
	}
}