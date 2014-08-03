package 
{
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.events.Event;

	public class Explosion extends Sprite
	{
		public static function explosion(container:Sprite,x1:Number,y1:Number,amount:int=30,size:int=5,speed:int=60,color:int=0x000000):void
		{
			Sounds.play(Config.EXPLOSION_SOUND[int(Math.random() * Config.EXPLOSION_SOUND.length)]);

			var particle_qty:Number = Math.random() * amount / 2 + amount / 2;
			for (var i:int = 0; i < particle_qty; i++)
			{
				var pSize:Number = Math.random() * size - 1 + 1;
				var pAlpha:Number = Math.random();

				// draw the particle
				var p:Sprite = new Sprite  ;
				p.graphics.beginFill(color);
				//p.graphics.drawCircle(0,0,pSize);
				p.graphics.drawRect(0,0,pSize * Math.random(),pSize * Math.random());
				//p.graphics.drawEllipse(0,0,pSize, pSize);
				//p.graphics.drawRect(0,0,pSize, pSize);
				// create a movieclip so we can add properties to it;
				var particle:MovieClip = new MovieClip  ;
				particle.addChild(p);
				particle.x = x1;
				particle.y = y1;
				particle.alpha = pAlpha;

				// choose a direction and speed to send the particle
				var pFast:int = Math.round(Math.random() * 0.75);
				particle.pathX = Math.random() * speed - speed / 2 + pFast * Math.random() * 10 - 5;
				particle.pathY = Math.random() * speed - speed / 2 + pFast * Math.random() * 10 - 5;

				// this event gets triggered every frame
				particle.addEventListener(Event.ENTER_FRAME,particlePath);
				container.addChild(particle);
			}
		}

		// moves the particle
		private static function particlePath(e:Event):void
		{
			e.target.x +=  e.target.pathX;
			e.target.y +=  e.target.pathY;
			e.target.alpha -=  0.005;

			// removes the particle from stage when its alpha reaches zero
			// or when it bounces out of the box
			if (e.target.alpha <= 0 || e.target.x > 800 || e.target.x < 0 || e.target.y > 500 || e.target.y < 0)
			{
				e.target.removeEventListener('enterFrame',particlePath);
				e.target.parent.removeChild(e.target);
			}
		}
	}
}