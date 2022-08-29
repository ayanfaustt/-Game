import 'package:bonfire/base/game_component.dart';
import 'package:flutter/material.dart';
import 'package:game/main.dart';

class GameController extends GameComponent {
  bool endGame = false;

  GameController(this.endGame);

  @override
  void update(double dt) {
    if (checkInterval('gameover', 500, dt)) {
      if (gameRef.player?.isDead == true || gameRef.livingEnemies().isEmpty && !endGame) {
        endGame = true;
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text("Game Over !"),
                actions: [
                  TextButton(
                    onPressed: () => {
                      reset()
                    },
                    child: Text("Play Again !"),
                  ),
                ],
              );
            });
      }
    }
    super.update(dt);
  }
  void reset(){
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context){
      return MyHomePage();
    }), (route) => false);
  }
}
