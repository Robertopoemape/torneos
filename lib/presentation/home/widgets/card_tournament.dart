import 'package:flutter/material.dart';
import 'package:proyecto_torneos/core/core.dart';

import '../../../components/components.dart';
import '../../../src/models/models.dart';

class CardTournament extends StatelessWidget {
  const CardTournament({
    required this.onPressed,
    required this.tournaments,
    super.key,
  });
  final Function(TournamentData) onPressed;
  final List<TournamentData> tournaments;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: ints2,
        crossAxisSpacing: ds16,
        mainAxisSpacing: ds16,
        childAspectRatio: 0.95,
      ),
      itemCount: tournaments.length,
      itemBuilder: (context, index) {
        final tournament = tournaments[index];
        return Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(ds8),
          child: InkWell(
            onTap: () => onPressed(tournament),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ds8),
                color: ComColors.white100,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 160,
                    child: ComImageSvg(
                      pathNetwork: tournament.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  gap4,
                  Expanded(
                    child: Center(
                      child: Text(
                        tournament.nameTournament,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: ComTextStyle.caption.w900,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
