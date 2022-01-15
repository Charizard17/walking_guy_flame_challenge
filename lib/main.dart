import 'package:flutter/material.dart';
import 'package:flame/game.dart';

import './walking_knight.dart';

main() {
  final game = WalkingKnight();
  runApp(
    GameWidget(game: game),
  );
}
