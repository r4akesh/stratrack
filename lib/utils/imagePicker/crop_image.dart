import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_crop/image_crop.dart';


class CropImage extends StatelessWidget {
  final cropKey = GlobalKey<CropState>();
  final File image;
  Function(File croppedImage) onCompletion;

  CropImage({Key? key, required this.image, required this.onCompletion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crop Image'),),
      body: Container(
          color: Colors.black,
          child: Column(
            children: <Widget>[
              Expanded(
                  child: Crop(
                    key: cropKey,
                    image: FileImage(image),
                  )
                // Crop.file(image, key: cropKey),
              ),
              Container(
                  padding: const EdgeInsets.only(),
                  alignment: AlignmentDirectional.center,
                  child: TextButton(
                      child: Text(
                        "Crop Image",
                        style: Theme.of(context).textTheme.button!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 5 + 18),
                      ),
                      onPressed: () async {
                        File img = await _cropImage(image);
                        Navigator.pop(context);
                        onCompletion(img);
                      }))
            ],
          )),
    );
  }

  Future<File> _cropImage(File image) async {
    final scale = cropKey.currentState!.scale;
    final area = cropKey.currentState!.area;
    if (area == null) {
      return image;
    }
    final file =
        await ImageCrop.cropImage(file: image, area: area, scale: scale);

    return file;
  }
}
