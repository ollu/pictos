package nu.fickla.pictos {
	import nu.fickla.pictos.data.PictosXMLParser;
	import nu.fickla.pictos.event.PictosXMLParserEvent;

	import flash.display.Sprite;

	/**
	 * @author Ola
	 */
	public class Pictos extends Sprite {
		
		public function Pictos() {
			var request : PictosXMLParser = new PictosXMLParser();
			request.addEventListener(PictosXMLParserEvent.LOAD_COMPLETE, xmlLoaded);
		}

		private function xmlLoaded(event : PictosXMLParserEvent) : void {
			loadImages(event.imagePaths);
		}
		
		
		private function loadImages(imgPaths : Array) : void {
			
		}
	}
}
