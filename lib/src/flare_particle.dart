part of flame_flare;

/// A [Particle] that renders a [FlareActorComponent].
class FlareParticle extends Particle {
  final FlareActorComponent flare;

  FlareParticle({
    @required this.flare,
    double lifespan,
  }) : super(
    lifespan: lifespan,
  );

  @override
  void render(Canvas canvas) {
    canvas.save();
    canvas.translate(-flare.width / 2, -flare.height / 2);
    flare.render(canvas);
    canvas.restore();
  }

  @override
  void update(double dt) {
    super.update(dt);
    flare.update(dt);
  }
}

