import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailsScreen extends StatelessWidget {
  final int tag;

  DetailsScreen({Key key, this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details screen"),
      ),
      body: Center(
        child: Hero(
          tag: tag,
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: "https://picsum.photos/300/300/?$tag",
          ),
        ),
      ),
    );
  }
}
