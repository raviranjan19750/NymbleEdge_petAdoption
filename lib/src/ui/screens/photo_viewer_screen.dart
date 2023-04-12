
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewerScreen extends StatelessWidget {
  const PhotoViewerScreen({Key? key, this.assetImage, this.id}) : super(key: key);
  final String? assetImage;
  final int? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Hero(
        tag: "dog_$id",
        child: PhotoView(
          imageProvider:  AssetImage(assetImage??"assets/icons/dog1.jpg"),
          enableRotation: true,
        ),
      ),
    );
  }
}
