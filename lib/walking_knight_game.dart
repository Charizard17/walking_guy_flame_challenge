import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';

class WalkingKnightGame extends FlameGame {
  SpriteComponent knight = SpriteComponent();
  SpriteAnimationComponent walkingKnight = SpriteAnimationComponent();
  String direction = 'right';
  double walkingSpeed = 1;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    SpriteComponent background = SpriteComponent()
      ..sprite = await loadSprite('background.png')
      ..size = size;
    add(background);

    knight
      ..sprite = await loadSprite('knight_stand.png')
      ..size = Vector2(58.7, 70.7)
      ..x = 150
      ..y = 250;
    add(knight);

    var spriteSheet = await images.load('knight_spritesheet.png');
    final spriteSize = Vector2(58.7, 70.7);
    SpriteAnimationData spriteData = SpriteAnimationData.sequenced(
        amount: 10,
        stepTime: 0.1,
        textureSize: Vector2(100 / 70.7 * 58.7, 100));
    walkingKnight =
        SpriteAnimationComponent.fromFrameData(spriteSheet, spriteData)
          ..x = 5
          ..y = 105
          ..size = spriteSize;

    // add(walkingKnight);
  }

  @override
  void update(double dt) {
    super.update(dt);

    switch (direction) {
      case 'right':
        walkingKnight.x += walkingSpeed;
        break;
      case 'down':
        walkingKnight.y += walkingSpeed;
        break;
      case 'left':
        walkingKnight.x -= walkingSpeed;
        break;
      case 'up':
        walkingKnight.y -= walkingSpeed;
        break;
    }

    if (walkingKnight.x > 300) {
      direction = 'down';
    }
    if (walkingKnight.y > 500) {
      direction = 'left';
    }
    if (walkingKnight.x < 5) {
      direction = 'up';
    }
    if (walkingKnight.y < 105) {
      direction = 'right';
    }
  }
}
