PImage image;
PImage convertedImage;
String[] imageToString = new String[100];
final color WHITE = color(255, 255, 255);
final color BLACK = color(0, 0, 0);
final int[] order = {1, 0};
final int LUMINOSITY = 100; // Max 255

void setup() {
  size(100, 100);
  image = loadImage("image.jpg");
  convertedImage = image;
  
  if(image.width > image.height) {
    convertedImage.resize(100,0);
  } else if(image.width < image.height) {
    convertedImage.resize(0,100);
  } else if(image.width == image.height) {
    convertedImage.resize(100,100);
  }
  
  for (int y = 0; y < image.height; y++) {
    imageToString[y] = "";
    for (int x = 0; x < image.width; x++) {
      if (red(image.get(x, y)) < LUMINOSITY || green(image.get(x, y)) < LUMINOSITY || blue(image.get(x, y)) < LUMINOSITY) {
        imageToString[y] += order[0];
        convertedImage.set(x, y, BLACK);
      } else {
        imageToString[y] += order[1];
        convertedImage.set(x, y, WHITE);
      }
    }
    
    if (imageToString[y].length() < 100) {
      for (int i = imageToString[y].length(); i < 100; i++) {
        imageToString[y] += "0";
      }
    }
  }
  for (int i = 0; i < imageToString.length; i++) {
    if (imageToString[i] == null || imageToString[i] == "") {
      imageToString[i] = "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    }
  }
  image(convertedImage, 0, 0);
  saveStrings("result.txt", imageToString);
  println("Converted image to text");
}
