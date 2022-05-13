import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../theme/themes.dart';

class CardImageView extends GetView{

  final String imageUrl;

  CardImageView({required this.imageUrl});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 100,
      width: 100,
      child: ClipRRect(
        borderRadius:
        BorderRadius.all(Radius.circular(8.0)),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,

          /// loading view while image is getting downloaded
          progressIndicatorBuilder:
              (_context, _url, _downloadProgress) =>
              Center(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: Themes.primaryColor,
                  value: _downloadProgress.progress,
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Themes.secondaryColor),
                  strokeWidth: 2.5,
                ),
              ),
            errorWidget: (context, url, error) => Center(child: Icon(Icons.error,color: Colors.red,)),
        ),
      ),
    );
  }

}