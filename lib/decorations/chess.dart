import 'package:bonfire/bonfire.dart';
import 'package:flutter/widgets.dart';
import 'package:game/decoration_sprite_sheet.dart';
import 'package:game/main.dart';
import 'package:game/player.dart';

class Chess extends GameDecoration with ObjectCollision{

  bool isClosed = true;

  Sprite? chess, chessOpen;

  Chess(Vector2 position) 
    : super.withSprite(
      sprite: DecorationSpriteSheet.chess, 
      position: position, 
      size: Vector2(16.0,16.0),
    ){
      setupCollision(
        CollisionConfig(collisions: [
          CollisionArea.rectangle(
            size: Vector2(16.0,16.0),
            align: Vector2(0,16)
          )
        ])
      );
    }
  
  @override
  void update(double dt) {
    seeComponentType<Player1>(
      observed: (player){
        isClosed = false;
        if(!isClosed){
          player[0].setCanAttack();

        }
        
      },
      notObserved: (){
        isClosed = true;
      },
      radiusVision: tileSize/2,
    );
    super.update(dt);
  }

  @override
  Future<void> onLoad() async{
    chess = await DecorationSpriteSheet.chess;
    chessOpen = await DecorationSpriteSheet.chessOpen;
    return super.onLoad();
  }

  @override
  void render (Canvas canvas){
    if(isClosed){
      sprite = chess;
    }else{
      sprite = chessOpen;
    }
    super.render(canvas);
  }

    
}