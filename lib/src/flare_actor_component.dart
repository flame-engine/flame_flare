part of flame_flare;

class _FlareActorComponentPipelineOwner extends PipelineOwner {}

/// A [PositionComponent] that renders a [FlareActorAnimation]
class FlareActorComponent extends PositionComponent {
  final FlareActorAnimation flareAnimation;

  FlareActorComponent(this.flareAnimation);

  @override
  void onMount() {
    super.onMount();
    flareAnimation.init();
  }

  @override
  void render(Canvas canvas) {
    prepareCanvas(canvas);
    canvas.save();
    flareAnimation.render(canvas, toPosition().toOffset());
  }

  @override
  void update(double dt) {
    super.update(dt);
    flareAnimation.advance(dt);
  }

  @override
  void onDestroy() {
    flareAnimation.destroy();
    super.onDestroy();
  }
}
