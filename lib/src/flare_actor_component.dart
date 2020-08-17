part of flame_flare;

class _FlareActorComponentPipelineOwner extends PipelineOwner {}

/// A [PositionComponent] that renders a [FlareActorAnimation]
class FlareActorComponent extends PositionComponent {
  final FlareActorAnimation flareAnimation;

  /// The animation size base.
  double width = 0.0, height = 0.0;

  FlareActorComponent(
    this.flareAnimation, {
    @required this.width,
    @required this.height,
  });

  @mustCallSuper
  @override
  void onMount() {
    super.onMount();
    flareAnimation.init();
  }

  @mustCallSuper
  @override
  void render(Canvas canvas) {
    prepareCanvas(canvas);
    final size = ui.Size(width, height);
    flareAnimation.render(canvas, size);
  }

  @mustCallSuper
  @override
  void update(double dt) {
    super.update(dt);
    flareAnimation.advance(dt);
  }

  @mustCallSuper
  @override
  void onDestroy() {
    flareAnimation.destroy();
    super.onDestroy();
  }
}
