part of '../dart_units.dart';

class Speed with Unit<Speed> {
  @override
  final num _value; // meters per second (m/s)

  const Speed.metersPerSecond(this._value);

  Speed({
    required Length length,
    required Duration duration,
  }) : _value = length._value / duration._value;

  static Speed meterPerSecond = const Speed.metersPerSecond(1e0),
      kilometerPerHour = meterPerSecond * 0.277778,
      footPerSecond = meterPerSecond * 0.3048,
      milePerHour = meterPerSecond * 0.44704,
      knot = meterPerSecond * 0.514444,
      speedOfLight = meterPerSecond * 299792458;

  operator *(num x) => Speed.metersPerSecond(_value * x);
  operator /(num x) => Speed.metersPerSecond(_value / x);
}
