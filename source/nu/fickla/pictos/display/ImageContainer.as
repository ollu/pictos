package nu.fickla.pictos.display {
	import nu.fickla.utils.Library;

	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	/**
	 * @author Ola
	 */
	public class ImageContainer extends Sprite {
		private var _imageLoader : Loader;
		private var _captionText : String;
		private var caption :TextField;
		private var Helvetica : Font = Library.createFont("Helvetica");
		private var scaled : Boolean;
		private var imageMask : Rectangle;
		private const scaleFactor : Number = .5; 

		public function ImageContainer(imageURL : String, captionText : String) {
			scaled = false;

			_captionText = captionText;

			imageMask = new Rectangle(0, 0, 200, 200);

			var request : URLRequest = new URLRequest(imageURL);
			_imageLoader = new Loader();
			_imageLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadCompleteHandler);
			_imageLoader.load(request);
			_imageLoader.scrollRect = imageMask;
			_imageLoader.scaleX = _imageLoader.scaleY = scaleFactor;

			_imageLoader.addEventListener(MouseEvent.CLICK, imageClicked);
		}

		private function imageClicked(event : MouseEvent) : void {
			if (scaled) {
				_imageLoader.scrollRect = imageMask;
				_imageLoader.scaleX = _imageLoader.scaleY = scaleFactor;
				caption.visible = true;
				scaled = false;
			} else {
				_imageLoader.scrollRect = null;
				_imageLoader.scaleX = _imageLoader.scaleY = 1;
				parent.swapChildren(parent.getChildAt(parent.getChildIndex(this)), parent.getChildAt(parent.numChildren-1));
				caption.visible = false;
				scaled = true;
			}
		}
		private function loadCompleteHandler(event : Event) : void {
			addChild(_imageLoader);
			createCaption(_captionText);
		}

		private function createCaption(captionText : String) : void {
			var format : TextFormat = new TextFormat();
			format.font = Helvetica.fontName;
			format.color = 0x000000;
			format.size = 10;
			format.align = TextFormatAlign.CENTER;

			caption = new TextField();
			caption.defaultTextFormat = format;
			caption.height = 10;
			caption.width = 100;
			caption.selectable = false;
			caption.embedFonts = true;
			caption.text = captionText;
			caption.y = _imageLoader.height + 10;

			addChild(caption);
		}
	}
}