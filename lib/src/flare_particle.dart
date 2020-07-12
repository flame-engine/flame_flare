part of flame_flare;

/// A [Particle] that renders a [FlareActorAnimation].
class FlareParticle extends Particle {
  final FlareActorAnimation flareAnimation;

  FlareParticle({
    @required this.flareAnimation,
    double lifespan,
  }) : super(
          lifespan: lifespan,
        ) {
    flareAnimation.init();
  }

  @override
  void render(Canvas canvas) {
    canvas.save();
    flareAnimation.render(
      canvas,
      Offset(-flareAnimation.width / 2, -flareAnimation.height / 2),
    );
    canvas.restore();
  }

  @override
  void update(double dt) {
    super.update(dt);
    flareAnimation.advance(dt);
  }
}
