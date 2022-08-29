import 'package:bonfire/bonfire.dart';

class PlayerSpriteSheet {
  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
      'gawain_.png',
      SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(32.0, 32.0),
          texturePosition: Vector2(0, 0)));

  static Future<SpriteAnimation> get idleLeft => SpriteAnimation.load(
      'gawain_.png',
      SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(32.0, 32.0),
          texturePosition: Vector2(128.0, 0)));

  static Future<SpriteAnimation> get idRunLeft => SpriteAnimation.load(
      'gawain_.png',
      SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(32.0, 32.0),
          texturePosition: Vector2(128.0, 96.0)));
  
   static Future<SpriteAnimation> get idRunRight => SpriteAnimation.load(
      'gawain_.png',
      SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(32.0, 32.0),
          texturePosition: Vector2(0, 96.0)));
    
  static Future<SpriteAnimation> get attackRight => SpriteAnimation.load(
      'excalibur_.png',
      SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(32.0, 32.0),
          texturePosition: Vector2(0, 32)));

  static Future<SpriteAnimation> get attackLeft => SpriteAnimation.load(
      'excalibur_.png',
      SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(32.0, 32.0),
          texturePosition: Vector2(0, 64.0)));

  static Future<SpriteAnimation> get reciveDamageRight => SpriteAnimation.load(
      'gawain_.png',
      SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(32.0, 32.0),
          texturePosition: Vector2(0, 224)));

  static Future<SpriteAnimation> get reciveDamageLeft => SpriteAnimation.load(
      'gawain_.png',
      SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(32.0, 32.0),
          texturePosition: Vector2(160.0, 224)));
}
