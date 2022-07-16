part of '../dart_units.dart';

class Angle extends Unit<Angle> {
  const Angle.radians(value) : super(value);

  static Angle yoctoradian = radian * 1e-24,
      zeptoradian = radian * 1e-21,
      attoradian = radian * 1e-18,
      femtoradian = radian * 1e-15,
      pictoradian = radian * 1e-12,
      nanoradian = radian * 1e-9,
      microradian = radian * 1e-6,
      milliradian = radian * 1e-3,
      centiradian = radian * 1e-2,
      deciradian = radian * 1e-1,
      radian = const Angle.radians(1e0),
      degree = radian * pi / 180,
      arcminute = degree / 60,
      arcsecond = degree / 3600,
      milliarcsecond = arcsecond * 1e-3,
      microarcsecond = arcsecond * 1e-6;

  // convenience functions
  get inRadians => _value;
  get inDegrees => inUnit(degree);

  /// Restricts the angle to a range, with [divisor] defaulting to a circle
  Angle mod(
          {Angle divisor = const Angle.radians(2 * pi),
          bool preserveRotation = false}) =>
      preserveRotation && _value < 0 && _value % divisor._value != 0
          ? _createRaw(_value % divisor._value - divisor._value)
          : _createRaw(_value % divisor._value);

  @override
  Angle _createRaw(num value) => Angle.radians(value);
}

var arcminute = Angle.arcminute;
