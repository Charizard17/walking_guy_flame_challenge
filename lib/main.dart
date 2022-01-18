import 'package:bonfire/bonfire.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flame/game.dart';

import 'walking_knight_game.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.setLandscape();
  final game = WalkingKnightGame();
  runApp(
    GameWidget(game: game),
  );
}
