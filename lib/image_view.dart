import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';



class ImageView360Screen extends StatefulWidget {
  const ImageView360Screen({Key? key}) : super(key: key);

  @override
  State<ImageView360Screen> createState() => _ImageView360ScreenState();
}

class _ImageView360ScreenState extends State<ImageView360Screen> {
  List<AssetImage> imageList = <AssetImage>[];


  @override
  void initState() {
    //* To load images from assets after first frame build up.

    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text('360 ImageView'),
      ),
      body: Center(
        child: Panorama(
          child: Image.network('https://burst.shopifycdn.com/photos/fashion-model-in-red-suit.jpg?width=1200&format=pjpg&exif=1&iptc=1'),

        ),
      ),
    );
  }


}
