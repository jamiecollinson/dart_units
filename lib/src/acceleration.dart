part of '../dart_units.dart';

class Acceleration extends Unit<Acceleration> {
  @override
  final num _value; // meters per second squared (m/s^2)

  Acceleration.metersPerSecondSquared(this._value);

  Acceleration({
    required Speed speed,
    required Duration duration,
  }) : _value = speed.inUnit(Speed.meterPerSecond) /
            duration.inUnit(Duration.second);

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

  operator *(num x) => Acceleration.metersPerSecondSquared(_value * x);
  operator /(num x) => Acceleration.metersPerSecondSquared(_value / x);
}
