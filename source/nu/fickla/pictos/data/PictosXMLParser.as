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
		private const URL_TO_XML : String = "pictos.xml";

		public function PictosXMLParser(target : IEventDispatcher = null) {
			super(target);

			var xmlLoader : URLLoader = new URLLoader();
			xmlLoader.addEventListener(Event.COMPLETE, LoadXML);
			xmlLoader.load(new URLRequest(URL_TO_XML));

		}

		private function LoadXML(event : Event) : void {
			
			var newEvent : PictosXMLParserEvent = new PictosXMLParserEvent(PictosXMLParserEvent.LOAD_COMPLETE);
			newEvent.xmlContent = ParseXML(event.target.data);
			dispatchEvent(newEvent);

		}

		private function ParseXML(xmlRawData : String) : Array {
			
			var xmlData : XML = new XML(xmlRawData);
			var xmlDataList : XMLList = xmlData.product;

			var entries : Array = new Array();

			for each (var xmlSrc : XML in xmlDataList) {
				var entry : PictosEntry = new PictosEntry(
												xmlSrc.attribute("img_url"),
												xmlSrc.attribute("prod_name")
				);
				entries.push(entry);
			}

			return entries;
			
		}
		
		
	}
}