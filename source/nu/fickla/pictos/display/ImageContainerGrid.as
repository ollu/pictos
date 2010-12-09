package nu.fickla.pictos.display {
	import nu.fickla.pictos.data.PictosEntry;

	import flash.display.Sprite;

	/**
	 * @author Ola
	 */
	public class ImageContainerGrid extends Sprite {
		
		private const IMAGE_WIDTH : uint 			= 100;
		private const IMAGE_HEIGHT : uint 			= 150;
		private const SPACE_BETWEEN_IMAGES : uint 	= 20;
		private const SPACE_BETWEEN_ROWS : uint 	= 20;
		private const NUMBER_OF_ROWS : uint 		= 3;

		public function ImageContainerGrid(imagePaths : Array) {
			
			placeImages(imagePaths);

		}

		private function placeImages(xmlContent : Array) : void {
			var counter : uint = 0;
			var rowCount : uint = 0;
			var imagePerRow : int = Math.ceil(xmlContent.length / NUMBER_OF_ROWS);

			for each (var xmlEntry : PictosEntry in xmlContent)
			{
				var imageContainer : ImageContainer = new ImageContainer(xmlEntry.img_url, xmlEntry.img_caption);
				imageContainer.x = 30 + (SPACE_BETWEEN_IMAGES + IMAGE_WIDTH) * counter;
				imageContainer.y = IMAGE_HEIGHT * rowCount + SPACE_BETWEEN_ROWS;
				
				imageContainer.buttonMode = true;
				imageContainer.mouseChildren = false;

				addChild(imageContainer);
				
				counter++;

				if(counter >= imagePerRow)
				{
					rowCount++;
					counter = 0;
				}
			}
			
		}
		
	}
}
