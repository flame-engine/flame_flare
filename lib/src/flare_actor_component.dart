part of flame_flare;

class _FlareActorComponentPipelineOwner extends PipelineOwner {}

/// A [PositionComponent] that renders a [FlareActorAnimation]
class FlareActorComponent extends PositionComponent {
  final FlareActorAnimation flareAnimation;

  FlareActorComponent(this.flareAnimation);

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
    canvas.save();
    flareAnimation.render(canvas, toPosition().toOffset());
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

  set width(double w) {
    super.width = w;
    flareAnimation.width = w;
  }

  set height(double h) {
    super.height = h;
    flareAnimation.height = h;
  }
}
