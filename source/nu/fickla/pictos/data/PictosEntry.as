package nu.fickla.pictos.data {
	/**
	 * @author Ola
	 */
	public class PictosEntry {
		
		private var _img_url : String;
		private var _img_caption : String;
		
		public function PictosEntry(img_url : String, img_caption : String) :void {
			_img_url = img_url;
			_img_caption = img_caption;
		}

		public function get img_url() : String {
			return _img_url;
		}

		public function get img_caption() : String {
			return _img_caption;
		}
	}
}
