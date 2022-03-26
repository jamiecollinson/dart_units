part of '../dart_units.dart';

class Force extends Unit<Force> {
  Force.newtons(num value) : super(value);

  static Force
      // SI
      newton = Force.newtons(1e0),

      // non-SI
      dyne = newton * 1e-5,
      kilogramForce = newton * 9.80665,
      poundForce = newton * 4.448222,
      poundal = newton * 0.138255,

      // aliases
      kilopond = kilogramForce;

  @override
  Force _createRaw(num value) => Force.newtons(value);
}
