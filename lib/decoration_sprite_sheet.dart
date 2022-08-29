import 'package:bonfire/bonfire.dart';

class DecorationSpriteSheet {
  static Future<Sprite> get chess => Sprite.load(
    'map/puddleObjects_.png',
    srcPosition: Vector2(64.0,48.0),
    srcSize: Vector2(16, 32)
  );
  static Future<Sprite> get chessOpen => Sprite.load(
    'map/puddleObjects_.png',
    srcPosition: Vector2(80.0,48.0),
    srcSize: Vector2(16, 32)
  );
}