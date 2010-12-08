package nu.fickla.pictos.event {
	import flash.events.Event;

	/**
	 * @author Ola
	 */
	public class PictosXMLParserEvent extends Event {
		
		public static const LOAD_COMPLETE : String = "load completed";
		
		private var _imagePaths : Array;
		
		public function PictosXMLParserEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false) {
			super(type, bubbles, cancelable);
		}

		public function get imagePaths() : Array {
			return _imagePaths;
		}

		public function set imagePaths(imagePaths : Array) : void {
			_imagePaths = imagePaths;
		}
		
		
	}
}
