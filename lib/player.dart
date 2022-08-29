import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game/main.dart';
import 'package:game/playerAnimation.dart';

class Player1 extends SimplePlayer with ObjectCollision, Lighting{

  bool canAttack = false;
  int attackCounter = 5;
  
  Player1(Vector2 position)
    :super(
      position: position,
      animation: SimpleDirectionAnimation(
        idleRight: PlayerSpriteSheet.idleRight ,
        idleLeft: PlayerSpriteSheet.idleLeft ,
        runRight: PlayerSpriteSheet.idRunRight,
        runLeft: PlayerSpriteSheet.idRunLeft,
      ),
      size: Vector2(32.0, 32.0),
      speed: 80,
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

      setupLighting(
        LightingConfig(
          radius: tileSize * 1.25 ,
          color: Colors.transparent,
          withPulse: true,
        )
      );
    }

  void setCanAttack(){
    print('agora eu posso atacar');
    canAttack = true;
  }
  

  @override
  void joystickAction(JoystickActionEvent event) {
    
    if (event.event == ActionEvent.DOWN && event.id == 1){ 
      _atacar();
    }


    super.joystickAction(event);
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) {
    if(lastDirectionHorizontal == Direction.right){
      animation?.playOnce(PlayerSpriteSheet.reciveDamageRight, runToTheEnd: true);
    }else{
      animation?.playOnce(PlayerSpriteSheet.reciveDamageLeft, runToTheEnd: true);
    }
    super.receiveDamage(attacker, damage, identify);
  }
    
    void _atacar() {
      if(canAttack){
        if(attackCounter > 0){
            simpleAttackMelee(
            damage: 20,
            size: Vector2(24.0,24.0),
            sizePush: tileSize,
            animationRight: PlayerSpriteSheet.attackRight,
          );
          attackCounter -= 1;
        }else{
          canAttack = false;
          attackCounter = 5;
        }
      }
    }
  @override
  void die() {
    removeFromParent();
    super.die();
  }
}