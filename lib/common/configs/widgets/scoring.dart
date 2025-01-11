import 'package:flutter/material.dart';

class Scoring extends StatelessWidget {
  const Scoring({
    super.key,
    this.hasShowNumberScore = true,
    this.hasShowVotes = true,
  });

  final bool hasShowNumberScore;
  final bool hasShowVotes;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        hasShowNumberScore
            ? Text(
                '4.5',
                style: Theme.of(context).textTheme.labelMedium,
              )
            : const SizedBox(),
        const Icon(Icons.star, size: 21),
        const Icon(Icons.star, size: 21),
        const Icon(Icons.star, size: 21),
        const Icon(Icons.star, size: 21),
        const Icon(Icons.star_border, size: 21),
        hasShowNumberScore
            ? Text(
                '(55)',
                style: Theme.of(context).textTheme.bodyMedium,
              )
            : const SizedBox(),
      ],
    );
  }
}
