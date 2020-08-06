import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/resizable.dart';
import 'package:flame/gestures.dart';
import 'package:flame/game.dart';
import 'package:flame/text_config.dart';
import 'package:flame/position.dart';
import 'package:flame/palette.dart';
import 'package:flame_flare/flame_flare.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_controls.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final game = MyGame();
  runApp(game.widget);
}

class MyGame extends BaseGame with TapDetector, DoubleTapDetector {
  final TextConfig fpsTextConfig = TextConfig(color: BasicPalette.white.color);

  final paint = Paint()..color = const Color(0xFFE5E5E5E5);
  final List<String> _animations = ['Wave', 'Dance'];
  int _currentAnimation = 0;
  MinionComponent minionComponent;
  MinionController minionController;

  bool loaded = false;

  MyGame() {
    minionController = MinionController();
    minionComponent = MinionComponent(minionController);
    minionComponent.x = 0;
    minionComponent.y = 0;
    add(BGComponent());
    add(minionComponent);
    minionController.playStand();
  }

  @override
  bool debugMode() => true;

  @override
  void onTap() {
    minionController.playJump();
  }

  @override
  void onDoubleTap() {
    cycleAnimation();
  }

  void cycleAnimation() {
    if (_currentAnimation == 1) {
      _currentAnimation = 0;
    } else {
      _currentAnimation++;
    }
    minionComponent.minionController.play(_animations[_currentAnimation]);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    if (debugMode()) {
      fpsTextConfig.render(canvas, fps(120).toString(), Position(0, 10));
    }
  }
}

class MinionController extends FlareControls {
  void playStand() {
    play("Stand");
  }

  void playDance() {
    play("Dance");
  }

  void playJump() {
    play("Jump");
  }

  void playWave() {
    play("Wave");
  }
}

class MinionComponent extends FlareActorComponent with Resizable {
  MinionController minionController;

  MinionComponent(this.minionController)
      : super(FlareActorAnimation(
          'assets/Bob_Minion.flr',
          controller: minionController,
          fit: BoxFit.contain,
          alignment: Alignment.bottomCenter,
          width: 306,
          height: 500,
        ));

  @override
  void resize(Size size) {
    super.resize(size);
    width = size.width;
    height = size.height;
  }
}

class BGComponent extends Component with Resizable {
  @override
  void render(Canvas c) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final paint = Paint()..color = const Color(0xFFFFFFFF);
    c.drawRect(rect, paint);
  }

  @override
  void update(double t) {}
}
