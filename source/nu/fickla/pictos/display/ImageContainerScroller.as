package nu.fickla.pictos.display {
	import flash.display.Sprite;

	/**
	 * @author Ola
	 */
	public class ImageContainerScroller extends Sprite {
		
		private var _direction : String;
		
		public function ImageContainerScroller() {
		}

		public function get direction() : String {
			return _direction;
		}

		public function set direction(direction : String) : void {
			_direction = direction;
		}
	}
}
