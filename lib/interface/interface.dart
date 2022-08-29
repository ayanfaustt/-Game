import 'package:bonfire/base/bonfire_game.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Interface extends StatefulWidget {

  final BonfireGame game;

  static const OverlayKey = 'interface';

  const Interface({Key? key, required this.game}) : super(key: key);

  @override
  State<Interface> createState() => _InterfaceState();
}

class _InterfaceState extends State<Interface> {

  late Timer _lifeTime;

  final double maxWidth = 100;
  double currentWidth = 100;
  double life = 0;

  @override
  void initState() {
    _lifeTime = Timer.periodic(const Duration(milliseconds:100),_lifeChecker);
    super.initState();
  }

  @override
  void dispose() {
    _lifeTime.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      width: currentWidth,
      height: 20,
      color: Colors.pink ,
    );
  }
  
  _lifeChecker(Timer timer) {
    if(life != (widget.game.player?.life ?? 0)){
      setState(() {
        life = widget.game.player?.life ?? 0;
        
        final percent = life / (widget.game.player?.maxLife ?? 0);
        currentWidth = maxWidth * percent;

      });
    }

  }
}