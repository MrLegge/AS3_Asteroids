package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	public class StarShip extends MovieClip {
		
		//ship control
		var upPressed: Boolean;
		var leftPressed: Boolean;
		var rightPressed: Boolean;
		var spacePressed:Boolean;
		
		// ship calculations
		var shipRotation:Number;
		var shipThrust:Number;
		var shipRadians:Number;
		var shipDegrees:Number;
		var velocityX:Number;
		var velocityY:Number;
		
		
		var bullets:Array;
		//limits the ammount of bullets on the stage
		var maxBullets:int;
		
		public function StarShip(){
			// constructor code
			
			velocityX = 0;
			velocityY = 0;
			shipRadians = 0;
			maxBullets = 5;
			gotoAndStop(1);

			this.addEventListener(Event.ADDED_TO_STAGE, onAdd,false,0,true);
		}
		
		private function onAdd(e:Event):void{
			this.y = stage.stageHeight/ 2;
			this.x = stage.stageWidth / 2;
			this.scaleX = .2;
			this.scaleY = .2;
			bullets = new Array();
			this.addEventListener(Event.ENTER_FRAME,loop);
		}
		
		private function loop(e:Event):void{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPress,false,0,true);
						
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyRelease,false,0,true);
			
			if (this.rotation<0){
				shipDegrees = 360 + this.rotation;
			}else{
				shipDegrees = this.rotation;
					}
			shipRadians =  shipDegrees* Math.PI/ 180;
			if (upPressed) { 
				velocityY += Math.cos(shipRadians)*shipThrust;
				velocityX += Math.sin(shipRadians)*shipThrust;
			}
			if (leftPressed) {
				//myShip.x -= 5;
				this.rotation += shipRotation*3;
			}
			if (rightPressed) {
				//myShip.x += 5;
				this.rotation += shipRotation*3;
			}
			this.x += velocityX;
			this.y -= velocityY;
			
			/*for (var i:uint = 3; i<core.numChildren; i++) //this for loop is to access all the objects on the stage
			{
				var target:MovieClip = core.getChildAt(i);  //creates the object to test against
				if (this.hitTestObject(target)) //tests if the object has colided with the ship
				{
					target.removeListeners(); // takes listeners off the object
					core.removeChild(target); // takes the object off stage
					var boom:MovieClip = new explosion();
					boom.x = x;
					boom.y = y;
					stage.addChild(boom);
					this.removeEventListener(Event.ENTER_FRAME,loop); // takes the listeners off for loop
					this.removeEventListener(Event.ADDED_TO_STAGE, onAdd); // takes the listeners off the onadd

					//removeListeners(); //function that removes the actual ship

					
				}
			}*/
			for(var j:Number = 0; j<bullets.length; j++){
		
		if (bullets[j].getBulletDistance() < 180){
		bullets[j].x += bullets[j].getVelX()*3;
		bullets[j].y -= bullets[j].getVelY()*3;
		boundary(bullets[j]);
		bullets[j].setBulletDistance();
		}else{
			stage.removeChild(bullets[j]);
			bullets.splice(j,1);
			}
	}
		}
		
		function onKeyPress(evt:KeyboardEvent):void {
			if (evt.keyCode==Keyboard.UP) {
				upPressed = true;
				shipThrust = .1;
				this.gotoAndStop(2);
				
			} else if (evt.keyCode==Keyboard.LEFT) {
					leftPressed = true;
					shipRotation = -1;
					
			}else if (evt.keyCode==Keyboard.RIGHT) {
					rightPressed = true;
					shipRotation = 1;
					
			}else if (evt.keyCode==Keyboard.SPACE) {
					spacePressed = true;
					shootBullet();
			}
		}
		function onKeyRelease(evt:KeyboardEvent):void {
			if (evt.keyCode == Keyboard.UP){
		
				upPressed = false;
				this.gotoAndStop(1);
				shipThrust = 0;
		
			} else if (evt.keyCode == Keyboard.LEFT) {
		
				leftPressed = false;
		
			}else if (evt.keyCode == Keyboard.RIGHT) {
	 
				rightPressed = false;
	 
			}else if (evt.keyCode==Keyboard.SPACE) {
		
				spacePressed = false;
		
			}
	
		}
		function shootBullet():void{
	
			if(bullets.length<maxBullets) {
				var tempBullet:Bullet = new Bullet(this.x,this.y,Math.sin(shipRadians),Math.cos(shipRadians));
				stage.addChild(tempBullet);
				bullets.push(tempBullet);
				}
		}
		function boundary(gameObject:MovieClip):void{
			if(gameObject.x < 0) {
				gameObject.x = stage.stageWidth;	
			}else if(gameObject.x > stage.stageWidth){
				gameObject.x = 0;	
			}
			if(gameObject.y < 0) {
				gameObject.y = stage.stageHeight;	
			}else if(gameObject.y > stage.stageHeight){
				gameObject.y = 0;	
			}
		}
		
	}
	
}
