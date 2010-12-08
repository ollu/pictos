package nu.fickla.pictos.data {
	import nu.fickla.pictos.event.PictosXMLParserEvent;

	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	/**
	 * @author Ola
	 */
	public class PictosXMLParser extends EventDispatcher {
		private const XML_URL : String = "pictos.xml";

		public function PictosXMLParser(target : IEventDispatcher = null) {
			super(target);

			var xmlLoader : URLLoader = new URLLoader();
			xmlLoader.addEventListener(Event.COMPLETE, LoadXML);
			xmlLoader.load(new URLRequest(XML_URL));

		}

		private function LoadXML(event : Event) : void {
			
			var newEvent : PictosXMLParserEvent = new PictosXMLParserEvent(PictosXMLParserEvent.LOAD_COMPLETE);
			newEvent.imagePaths = ParseXML(event.target.data);
			dispatchEvent(newEvent);

		}

		private function ParseXML(xmlRawData : String) : Array {
			
			var xmlData : XML = new XML();
			xmlData = new XML(xmlRawData);

			var imageSrcList : XMLList = xmlData.Image.attribute("path");

			var arr : Array = new Array();

			for each (var imageSrc : XML in imageSrcList) {
				arr.push(imageSrc);
			}

			return arr;
			
		}
		
		
	}
}