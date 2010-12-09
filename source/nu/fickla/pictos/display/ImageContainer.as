package nu.fickla.pictos.display {
	import nu.fickla.utils.Library;

	import com.greensock.TweenLite;

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
		private var imageLoader : Loader;
		private var captionText : String;
		private var caption :TextField;
		private var Helvetica : Font = Library.createFont("Helvetica");
		private var scaled : Boolean;
		private var imageMask : Rectangle;
		private const scaleFactor : Number = .5;
		private var originX : int;
		private var originY : int;

		public function ImageContainer(imageURL : String, captionText : String) {
			scaled = false;

			this.captionText = captionText;
			this.addEventListener(Event.ADDED_TO_STAGE, addedToStage, false, 0, true);

			imageMask = new Rectangle(0, 0, 200, 200);

			var request : URLRequest = new URLRequest(imageURL);
			imageLoader = new Loader();
			imageLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadCompleteHandler, false, 0, true);
			imageLoader.load(request);
			imageLoader.scrollRect = imageMask;
			imageLoader.scaleX = imageLoader.scaleY = scaleFactor;

			imageLoader.addEventListener(MouseEvent.CLICK, imageClicked, false, 0, true);
			
		}

		private function addedToStage(event : Event) : void {
			this.removeEventListener(Event.ADDED_TO_STAGE, addedToStage);

			originX = this.x;
			originY = this.y;
		}

		private function imageClicked(event : MouseEvent) : void {
			if (scaled) {
				imageLoader.scrollRect = imageMask;
				imageLoader.scaleX = imageLoader.scaleY = scaleFactor;

				caption.visible = true;
				scaled = false;

				TweenLite.to(this, .2, {x: originX, y: originY});

			} else {
				imageLoader.scrollRect = null;
				imageLoader.scaleX = imageLoader.scaleY = 1;

				parent.swapChildren(parent.getChildAt(parent.getChildIndex(this)), parent.getChildAt(parent.numChildren-1));

				var toX : int = stage.stageWidth / 2 - imageLoader.width / 2;
				var toY : int = stage.stageHeight / 2 - imageLoader.height / 2;
				TweenLite.to(this, .3, {x: toX, y: toY});

				caption.visible = false;
				scaled = true;
			}
		}

		private function loadCompleteHandler(event : Event) : void {
			addChild(imageLoader);
			createCaption(captionText);
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
			caption.y = imageLoader.height + 10;

			addChild(caption);
		}
	}
}