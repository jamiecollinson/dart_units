part of '../dart_units.dart';

// In meters per second (m/s)
class Speed extends Unit<Speed> {
  const Speed.metersPerSecond(num value) : super(value);

  Speed({
    required Length length,
    required Duration duration,
  }) : super(length._value / duration._value);

  static Speed meterPerSecond = const Speed.metersPerSecond(1e0),
      kilometerPerHour = meterPerSecond * 0.277778,
      footPerSecond = meterPerSecond * 0.3048,
      milePerHour = meterPerSecond * 0.44704,
      knot = meterPerSecond * 0.514444,
      speedOfLight = meterPerSecond * 299792458;

  @override
  Speed _createRaw(num value) => Speed.metersPerSecond(value);
}
