package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class StarShipExplosion extends MovieClip {
		
		
		public function StarShipExplosion() {
			// constructor code
			addEventListener(Event.ENTER_FRAME, removeListeners,false,0,true);
			
		}
		public function removeListeners(e:Event):void
		{
			if (currentFrame == framesLoaded)
			{
				removeEventListener(Event.ENTER_FRAME,removeListeners);
				parent.removeChild(this);
			}
		}
	
}
}	