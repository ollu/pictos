package nu.fickla.pictos.display {
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;

	/**
	 * @author Ola
	 */
	public class ImageContainer extends Sprite {
		private var imageLoader : Loader;

		public function ImageContainer(imageURL : String) {

			var request : URLRequest = new URLRequest(imageURL);
			imageLoader = new Loader();
			imageLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadCompleteHandler);
			imageLoader.load(request);

		}

		private function loadCompleteHandler(event : Event) : void {

			addChild(imageLoader);

		}
	}
}
