import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';

class WalkingKnightGame extends FlameGame {
  SpriteComponent knight = SpriteComponent();
  SpriteAnimationComponent knightWalking = SpriteAnimationComponent();
  SpriteAnimationComponent knightAttacking = SpriteAnimationComponent();
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

    var spriteSheetWalking = await images.load('knight_walk_spritesheet.png');
    final spriteSize = Vector2(58.7, 70.7);
    SpriteAnimationData spriteData = SpriteAnimationData.sequenced(
        amount: 10,
        stepTime: 0.1,
        textureSize: Vector2(100 / 70.7 * 58.7, 100));
    knightWalking =
        SpriteAnimationComponent.fromFrameData(spriteSheetWalking, spriteData)
          ..x = 5
          ..y = 250
          ..size = spriteSize;
    add(knightWalking);

    var spriteSheetAttacking =
        await images.load('knight_attack_spritesheet.png');
    // SpriteAnimationData spriteData = SpriteAnimationData.sequenced(
    //     amount: 10,
    //     stepTime: 0.1,
    //     textureSize: Vector2(100 / 70.7 * 58.7, 100));
    knightAttacking =
        SpriteAnimationComponent.fromFrameData(spriteSheetAttacking, spriteData)
          ..x = 250
          ..y = 250
          ..size = spriteSize;

    add(knightAttacking);
  }

  @override
  void update(double dt) {
    super.update(dt);

    switch (direction) {
      case 'right':
        knightWalking.x += walkingSpeed;
        break;
      case 'left':
        knightWalking.x -= walkingSpeed;
        break;
    }

    if (knightWalking.x > size[0] - 80) {
      direction = 'left';
    }
    if (knightWalking.x < 20) {
      direction = 'right';
    }
  }
}
