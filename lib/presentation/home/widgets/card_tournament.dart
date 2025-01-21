import 'package:flutter/material.dart';
import 'package:proyecto_torneos/core/core.dart';

import '../../../src/models/models.dart';

class CardTournament extends StatelessWidget {
  const CardTournament({
    required this.onPressed,
    required this.tournaments,
    super.key,
  });
  final Function(String) onPressed;
  final List<TournamentData> tournaments;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: ints2,
        crossAxisSpacing: ds16,
        mainAxisSpacing: ds16,
      ),
      itemCount: tournaments.length,
      itemBuilder: (context, index) {
        final tournament = tournaments[index];
        return InkWell(
          onTap: () => onPressed(tournament.tournamentId),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(ds8),
                child: Image.network(
                  tournament.imageUrl,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              gap2,
              Expanded(
                child: Center(
                  child: Text(
                    tournament.nameTournament,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: ComTextStyle.caption,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
