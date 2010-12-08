package nu.fickla.pictos.display {
	import nu.fickla.pictos.data.PictosEntry;

	import flash.display.Sprite;

	/**
	 * @author Ola
	 */
	public class ImageContainerGrid extends Sprite {

		public function ImageContainerGrid(imagePaths : Array) {
			
			placeImages(imagePaths);


		}

		private function placeImages(xmlContent : Array) : void {
			
			for each (var xmlEntry : PictosEntry in xmlContent)
			{
				var imageContainer : ImageContainer = new ImageContainer(xmlEntry.img_url);
				
				addChild(imageContainer);	
			}
			
		}
		
	}
}
