// image_urls.dart

class ImageData {
  final String imageUrl;
  final String description;

  ImageData(this.imageUrl, this.description);
}

List<ImageData> imageDataList = [
  ImageData(
    'https://firebasestorage.googleapis.com/v0/b/idealschool-3beeb.appspot.com/o/animals%2F1.png?alt=media&token=814bfa47-a2a3-428b-8dea-76a7c0246534',
    'This is a pig',
  ),
  ImageData(
    'https://firebasestorage.googleapis.com/v0/b/idealschool-3beeb.appspot.com/o/animals%2F2.png?alt=media&token=your_token_here',
    'This is a rabbit',
  ),
  ImageData(
    'https://firebasestorage.googleapis.com/v0/b/idealschool-3beeb.appspot.com/o/animals%2F3.png?alt=media&token=your_token_here',
    'This is a cat',
  ),
  // Add more image data here
];
