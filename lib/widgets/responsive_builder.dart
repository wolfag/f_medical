import 'package:f_medical/utils/theme.dart';
import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    Key? key,
    required this.portrait,
    required this.landscape,
  }) : super(key: key);

  final Widget portrait;
  final Widget landscape;

  @override
  Widget build(BuildContext context) {
    Orientation orientation = context.orientation;

    return orientation == Orientation.portrait ? portrait : landscape;
  }
}
