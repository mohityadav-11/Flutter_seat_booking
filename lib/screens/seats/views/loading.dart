import 'package:flutter/material.dart';

import '../../../theme/themes.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(
        backgroundColor: Colors.grey,
        valueColor: AlwaysStoppedAnimation<Color>(Themes.primaryColor),
        strokeWidth: 2.5,
      ),
    );
  }
}
