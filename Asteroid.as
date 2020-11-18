package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class Asteroid extends MovieClip {
		
		var spin:Number;
		var power:Number;
		var velocityX:Number;
		var velocityY:Number;
		
		public function Asteroid() {
			// constructor code
			this.addEventListener(Event.ADDED_TO_STAGE, onAdd,false,0,true);
			
		}
		
		function onAdd(evt:Event):void{
			this.x = Math.random()*stage.stageWidth;
			this.y = Math.random()*stage.stageHeight;
			if (this.x > 225 && this.x < 325){
					this.x = 375;
				}
			if (this.y > 150 && this.y < 250){
					this.y = 300;
				}
			this.rotation = Math.random()*180;
			spin = Math.random()*3;
			power = Math.random();	
			var temp = Math.random(); 	
			if (temp < 0.5){
				power = power*-1;
			}
			temp = Math.random();
			if (temp < 0.5){
				spin = spin*-1;
			}
			velocityX = Math.random()*power; 	
			velocityY = Math.random()*power;	
			}
			
		public function getSpin():Number{
			return spin;
		}
		public function getVelX():Number{
			return velocityX;
		}
		public function getVelY():Number{
			return velocityY;
		}
	}
	
	
}
