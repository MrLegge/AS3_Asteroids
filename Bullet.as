package  {
	
	import flash.display.MovieClip;
	
	
	public class Bullet extends MovieClip {
		
		var bulletSpeed:Number;
		var bulletDistance:Number;
		var velocityX:Number;
		var velocityY:Number;
		
		public function Bullet(shipX, shipY, velX, velY) {
			// constructor code
			bulletDistance = 0;
			bulletSpeed = 0.5;
			this.x = shipX;
			this.y = shipY;
			velocityX = velX*bulletSpeed;
			velocityY = velY*bulletSpeed;
			trace("bullet " +velX+ " "+velY);
		}
		
		public function getSpeed():Number{
			return bulletSpeed;
		}
		public function getVelX():Number{
			return velocityX;
		}
		public function getVelY():Number{
			return velocityY;
		}
		public function setBulletDistance():void{
			bulletDistance++;
			}
		public function getBulletDistance():Number{
			return bulletDistance;
			}
	}
	
}
