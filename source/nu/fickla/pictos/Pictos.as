package nu.fickla.pictos {
	import nu.fickla.pictos.data.PictosXMLParser;
	import nu.fickla.pictos.display.ImageContainerGrid;
	import nu.fickla.pictos.display.ImageContainerScroller;
	import nu.fickla.pictos.event.PictosXMLParserEvent;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * @author Ola
	 */
	public class Pictos extends Sprite {
		
		private var imageContainerGrid : ImageContainerGrid; 
		
		public function Pictos() {
			
			var request : PictosXMLParser = new PictosXMLParser();
			request.addEventListener(PictosXMLParserEvent.LOAD_COMPLETE, xmlLoaded);
			
		}

		private function xmlLoaded(event : PictosXMLParserEvent) : void {
			
			imageContainerGrid = new ImageContainerGrid(event.xmlContent);
			addChild(imageContainerGrid);

			createScrollerControls();
			
		}
		
		private function createScrollerControls() : void {
			var leftScrollerControl : ImageContainerScroller = new ImageContainerScroller();
			var rightScrollerControl : ImageContainerScroller = new ImageContainerScroller();

			leftScrollerControl.rotation 	= 180;
			leftScrollerControl.y 			= 464;
			leftScrollerControl.x 			= 59;
			rightScrollerControl.x 			= 741;
			leftScrollerControl.alpha 		= .1; 
			rightScrollerControl.alpha 		= .1;

			rightScrollerControl.direction 	= "RIGHT";
			leftScrollerControl.direction 	= "LEFT";

			leftScrollerControl.addEventListener(MouseEvent.MOUSE_OVER, scrollerOver);
			leftScrollerControl.addEventListener(MouseEvent.MOUSE_OUT, scrollerOut);

			rightScrollerControl.addEventListener(MouseEvent.MOUSE_OVER, scrollerOver);
			rightScrollerControl.addEventListener(MouseEvent.MOUSE_OUT, scrollerOut);

			rightScrollerControl.buttonMode = true;
			rightScrollerControl.mouseChildren = false;

			leftScrollerControl.buttonMode = true;
			leftScrollerControl.mouseChildren = false;
			
			addChild(leftScrollerControl);
			addChild(rightScrollerControl);
		}

		private function scrollerOver(event : MouseEvent) : void {
			event.target.alpha = .5;
			event.target.addEventListener(Event.ENTER_FRAME, scrollContent, false, 0, true);
		}

		private function scrollContent(event : Event) : void {
			if (event.target.direction == "LEFT")
				imageContainerGrid.x < 0 ? imageContainerGrid.x += 10 : imageContainerGrid.x;
			
			if (event.target.direction == "RIGHT")
				imageContainerGrid.x > -(imageContainerGrid.width - 670) ? imageContainerGrid.x -= 10 : imageContainerGrid.x;
		}

		private function scrollerOut(event : MouseEvent) : void {
			event.target.removeEventListener(Event.ENTER_FRAME, scrollContent);
			event.target.alpha = .1;
		}
	}
}
