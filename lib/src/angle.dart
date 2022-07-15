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

//convenience functions
  get inRadians => _value;
  get inDegrees => inUnit(degree);

  @override
  Angle _createRaw(num value) => Angle.radians(value);
}
