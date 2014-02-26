package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Emil Ahlqvist
	 */
	public class Main extends Sprite 
	{
		private var circle:Sprite;
		private var circles:Vector.<Sprite> = new Vector.<Sprite>;
		private var bc:Sprite = new Sprite();
		private var text:TextField;
		private var score:Number; 
		public function Main():void 
		
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			score = 0;
			text = new TextField
			text.x = 50;
			stage.addChild(text);
			updateScore();
			
			bc.graphics.beginFill(0xB01CAD);
			bc.graphics.drawCircle( 30, 30, 30);
			bc.graphics.endFill();
			addChild(bc);
			bc.x = Math.random() * stage.stageWidth - bc.width;
			bc.y = Math.random() * stage.stageHeight - bc.height;
			bc.addEventListener(MouseEvent.CLICK, bomClick);
			
			
			for (var i:int = 0; i < 19; i++) 
			{
				
				circle = new Sprite; 
				circle.graphics.beginFill(0xB01CAD);
				circle.graphics.drawCircle( 30, 30, 30);
				circle.graphics.endFill();
				circles.push(circle);
				
				stage.addChild(circle);
				
				circle.x = Math.random() * stage.stageWidth - circle.width;
				circle.y = Math.random() * stage.stageHeight - circle.height
				
				circle.addEventListener(MouseEvent.CLICK, clickCircle);
			}
		   
			
		}
		
		private function bomClick(e:MouseEvent):void 
		{
			for (var i:int = 0; i < 19; i++) 
			{
				Sprite(circles[i]).visible = false;
				bc.visible = false;
			}
		}
		
		private function clickCircle(e:Event):void 
		{
			Sprite(e.target).visible = false;
			score++;
			updateScore();
		}
		
		private function  updateScore():void
		
		
		{
		   
		   text.text = "Score: " + score;
		}
		
		
		
			
		
	
}   }