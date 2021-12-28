import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../size_config.dart';

class LodingWidget extends StatelessWidget {
  const LodingWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset('asset/lotties/loading.json',
          width: getProportionateScreenWidth(20)),
    );
  }
}
