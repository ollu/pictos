package nu.fickla.pictos.display {
	import nu.fickla.pictos.data.PictosEntry;

	import flash.display.Sprite;

	/**
	 * @author Ola
	 */
	public class ImageContainerGrid extends Sprite {
		
		private const imageWidth : uint = 100;
		private const imageHeight : uint = 150;
		private const imageSpace : uint = 20;
		private const imagePerRow : uint = 6;

		public function ImageContainerGrid(imagePaths : Array) {
			
			placeImages(imagePaths);

		}

		private function placeImages(xmlContent : Array) : void {
			var counter : uint = 0;
			var rowCount : uint = 0;

			for each (var xmlEntry : PictosEntry in xmlContent)
			{
				var imageContainer : ImageContainer = new ImageContainer(xmlEntry.img_url, xmlEntry.img_caption);
				imageContainer.x = imageWidth * counter + imageSpace;
				imageContainer.y = imageHeight * rowCount + imageSpace;

				addChild(imageContainer);
				
				counter++;

				if(counter % imagePerRow == 0)
				{
					rowCount++;
					counter = 0;
				}
			}
			
		}
		
	}
}
