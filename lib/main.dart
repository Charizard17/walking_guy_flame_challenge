import 'package:flutter/material.dart';
import 'package:flame/game.dart';

import 'walking_knight_game.dart';

main() {
  final game = WalkingKnightGame();
  runApp(
    GameWidget(game: game),
  );
}
