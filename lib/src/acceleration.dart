part of '../dart_units.dart';

// meters per second squared (m/s^2)
class Acceleration extends Unit<Acceleration> {
  Acceleration.metersPerSecondSquared(num value) : super(value);

  Acceleration({
    required Speed speed,
    required Duration duration,
  }) : super(speed.inUnit(Speed.meterPerSecond) /
            duration.inUnit(Duration.second));

  static Acceleration
      // SI
      centimeterPerSecondSquared = meterPerSecondSquared * 1e-2,
      meterPerSecondSquared = Acceleration.metersPerSecondSquared(1e0),
      // US
      footPerSecondSquared = meterPerSecondSquared * 0.304800,
      // space
      standardGravity = meterPerSecondSquared * 9.80665,
      // alias
      gal = centimeterPerSecondSquared;

  @override
  Acceleration _createRaw(num value) =>
      Acceleration.metersPerSecondSquared(value);
}
