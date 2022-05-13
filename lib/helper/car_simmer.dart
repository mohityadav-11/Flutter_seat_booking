import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

cardShimmer() => Shimmer.fromColors(
  baseColor: Colors.grey[300]!,
  highlightColor: Colors.grey,
  child: Material(
    elevation: 10,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    child: Container(
      height: 100,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
    ),
  ),
);