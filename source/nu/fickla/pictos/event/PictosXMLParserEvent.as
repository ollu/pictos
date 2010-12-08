package nu.fickla.pictos.event {
	import flash.events.Event;

	/**
	 * @author Ola
	 */
	public class PictosXMLParserEvent extends Event {
		
		public static const LOAD_COMPLETE : String = "load completed";
		
		private var _xmlContent : Array;
		
		public function PictosXMLParserEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false) {
			super(type, bubbles, cancelable);
		}

		public function get xmlContent() : Array {
			return _xmlContent;
		}

		public function set xmlContent(xmlContent : Array) : void {
			_xmlContent = xmlContent;
		}
		
		
	}
}
