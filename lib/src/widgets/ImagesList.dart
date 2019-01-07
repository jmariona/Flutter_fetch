import 'package:flutter/material.dart';
import '../models/M_image.dart';


class ImagesList extends StatelessWidget{
 final List<M_image> _images;

  ImagesList(this._images);

@override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _images.length,
      itemBuilder: (context, int _index ){
          return Container(
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.cyan)
            ),
            child: Image.network(_images[_index].url),
          );
      },
    );
  }
}