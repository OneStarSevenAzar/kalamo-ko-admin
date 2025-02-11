import 'package:flutter/material.dart';

class Activate extends StatelessWidget {
  const Activate({
    super.key,
    required this.child,
    required this.hasActive,
  });

  final Widget child;
  final bool hasActive;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Expanded(
      child: Stack(
        children: [
          child,
          Visibility(
            visible: !hasActive,
            child: Container(
              width: width,
              height: height,
              color: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
