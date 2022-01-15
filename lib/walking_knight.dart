import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';

class WalkingKnight extends FlameGame {
  SpriteComponent knight = SpriteComponent();

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    print('walking knight');

    knight
      ..sprite = await loadSprite('knight_stand.png')
      ..size = Vector2(58.7*1.5, 70.7*1.5)
      ..x = 50
      ..y = 50;
    add(knight);
  }
}
