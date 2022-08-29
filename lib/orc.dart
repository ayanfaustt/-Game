import 'package:bonfire/bonfire.dart';
import 'package:game/main.dart';
import 'package:game/orcAnimation.dart';

class Orc extends SimpleEnemy with ObjectCollision, AutomaticRandomMovement{
  Orc(Vector2 position) : super(
    position: position,
    size: Vector2(32.0, 32.0),
    animation: SimpleDirectionAnimation(
      idleRight: OrcSpriteSheet.idleRight,
      idleLeft: OrcSpriteSheet.idleLeft,
      runLeft: OrcSpriteSheet.idRunLeft ,
      runRight: OrcSpriteSheet.idRunRight,
    ),
    speed: 70,
  ){
      setupCollision(
        CollisionConfig(
          collisions:[
            CollisionArea.rectangle(
              size: Vector2(15.0,15.0),
              align: Vector2(8,15)
            )

          ]
        )
      );
    }

  @override
  void update(double dt){
    seeAndMoveToPlayer(
      closePlayer: (player){
        _attack();
      },
      radiusVision: tileSize * 2,
      margin: 4,
    );
    runRandomMovement(dt);
      super.update(dt);
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) {
    if(lastDirectionHorizontal == Direction.right){
      animation?.playOnce(OrcSpriteSheet.reciveDamageRight, runToTheEnd: true);
    }else{
      animation?.playOnce(OrcSpriteSheet.reciveDamageLeft, runToTheEnd: true);
    }

    super.receiveDamage(attacker, damage, identify);
  }
    
  @override
  void die() {
    removeFromParent();
    super.die();
  }

  void _attack() {
    simpleAttackMelee(
      damage: 20,
      size: Vector2(24.0,24.0),
      sizePush: tileSize,
      withPush: true,
      animationRight: OrcSpriteSheet.attackRight
    );
        //canAtack = false;

  }


}