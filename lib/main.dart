import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:game/decorations/chess.dart';
import 'package:game/interface/interface.dart';
import 'package:game/orc.dart';
import 'package:game/player.dart';
import 'package:game/game_controller.dart' as controller;

final double tileSize = 32;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      joystick: Joystick(
        directional: JoystickDirectional(),
        actions: [
          JoystickAction(
            actionId: 1,
            color: Colors.red.shade100,
            margin: const EdgeInsets.all(40.0)
          )
        ],
      ),
      map: WorldMapByTiled(
        'map/mapa.json',
        objectsBuilder: {
          'orc': (properties)=> Orc(properties.position),
          'chess': (properties) => Chess(properties.position) 
        },
        forceTileSize: Vector2(tileSize,tileSize),
      ),
      player: Player1(
        Vector2(2*tileSize,10*tileSize,)
      ),
      overlayBuilderMap:{
        Interface.OverlayKey : (context, game) => Interface(game: game)
      },
      components: [
        controller.GameController(false),
      ],
      initialActiveOverlays: const [
        Interface.OverlayKey,
      ],
      cameraConfig: CameraConfig(
        moveOnlyMapArea: true,
        zoom: 1.5,
        smoothCameraEnabled: true,
      ),
      lightingColorGame: Colors.black.withOpacity(0.5),
    );
  }
}

