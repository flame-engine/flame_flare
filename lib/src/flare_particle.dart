part of flame_flare;

/// A [Particle] that renders a [FlareActorAnimation].
class FlareParticle extends Particle {
  final FlareActorAnimation flareAnimation;

  /// The animation size base.
  double width = 0.0, height = 0.0;

  FlareParticle({
    @required this.flareAnimation,
    double lifespan,
    @required this.width,
    @required this.height,
  }) : super(lifespan: lifespan) {
    flareAnimation.init();
  }

  @override
  void render(Canvas canvas) {
    canvas.save();
    final size = ui.Size(width, height);
    flareAnimation.render(canvas, size);
    canvas.restore();
  }

  @override
  void update(double dt) {
    super.update(dt);
    flareAnimation.advance(dt);
  }
}
