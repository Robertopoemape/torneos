import 'package:flutter/material.dart';
import '../../../core/core.dart';
import '../../../src/models/models.dart';
import 'widgets.dart';

class MatchList extends StatefulWidget {
  const MatchList({required this.matches, super.key});

  final List<MatchesData> matches;

  @override
  State<MatchList> createState() => _MatchListState();
}

class _MatchListState extends State<MatchList> {
  void removeMatchAt(int index) {
    if (index >= 0 && index < widget.matches.length) {
      widget.matches.removeAt(index);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.matches.length,
      itemBuilder: (context, index) {
        final match = widget.matches[index];
        return Column(
          children: [
            gap6,
            MatchOptionHeader(
              dateStart: match.dateStart,
              hour: match.hour,
              onTap: () => removeMatchAt(index),
            ),
            MatchCard(
              teamLocal: match.teamLocal,
              teamVisitant: match.teamVisitant,
            ),
          ],
        );
      },
    );
  }
}
