import 'package:flutter/material.dart';
import 'package:imageview360/imageview360.dart';

class ImageView360Screen extends StatefulWidget {
  const ImageView360Screen({Key? key}) : super(key: key);

  @override
  State<ImageView360Screen> createState() => _ImageView360ScreenState();
}

class _ImageView360ScreenState extends State<ImageView360Screen> {
  List<AssetImage> imageList = <AssetImage>[];
  bool autoRotate = true;
  int rotationCount = 2;
  int swipeSensitivity = 2;
  bool allowSwipeToRotate = true;
  RotationDirection rotationDirection = RotationDirection.anticlockwise;
  Duration frameChangeDuration = Duration(milliseconds: 50);
  bool imagePrecached = false;

  @override
  void initState() {
    //* To load images from assets after first frame build up.
    WidgetsBinding.instance
        .addPostFrameCallback((_) => updateImageList(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text('360 ImageView'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                (imagePrecached == true)
                    ? ImageView360(
                  key: UniqueKey(),
                  imageList: imageList,
                  autoRotate: false,
                  rotationCount: 2,
                  rotationDirection: RotationDirection.anticlockwise,
                  frameChangeDuration: Duration(milliseconds: 30),
                  swipeSensitivity: swipeSensitivity,
                  allowSwipeToRotate: allowSwipeToRotate,
/*                  onImageIndexChanged: (currentImageIndex) {
                    print("currentImageIndex: $currentImageIndex");
                  },*/
                )
                    : Text("Pre-Caching images..."),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void updateImageList(BuildContext context) async {
    for (int i = 1; i <= 3; i++) {
      imageList.add(AssetImage('assets/$i.jpg'));
      //* To precache images so that when required they are loaded faster.
      await precacheImage(AssetImage('assets/$i.jpg'), context);
    }
    setState(() {
      imagePrecached = true;
    });
  }

}
