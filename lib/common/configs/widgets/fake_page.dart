import 'package:flutter/material.dart';

class FakePage extends StatefulWidget {
  const FakePage({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<FakePage> createState() => _FakePageState();
}

class _FakePageState extends State<FakePage> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(toolbarHeight: 60),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'دیدگاه ها',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Expanded(child: widget.child),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
