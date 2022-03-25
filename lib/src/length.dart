// Inspired by...
// https://github.com/ianmackenzie/elm-units/blob/2.9.0/src/Area.elm
// https://github.com/martinlindhe/unit/blob/master/length.go

part of '../dart_units.dart';

class Length with Unit<Length> {
  @override
  final num _value; // Meters

  const Length.meters(this._value);

  static Length
      // SI
      yoctometer = meter * 1e-24,
      zeptometer = meter * 1e-21,
      attometer = meter * 1e-18,
      femtometer = meter * 1e-15,
      picometer = meter * 1e-12,
      angstrom = meter * 1e-10,
      nanometer = meter * 1e-9,
      micrometer = meter * 1e-6,
      millimeter = meter * 1e-3,
      centimeter = meter * 1e-2,
      decimeter = meter * 1e-1,
      meter = const Length.meters(1),
      decameter = meter * 1e1,
      hectometer = meter * 1e2,
      kilometer = meter * 1e3,
      scandinavianMile = meter * 1e4,
      megameter = meter * 1e6,
      gigameter = meter * 1e9,
      terameter = meter * 1e12,
      petameter = meter * 1e15,
      exameter = meter * 1e18,
      zettameter = meter * 1e21,
      yottameter = meter * 1e24,

      // US
      inch = meter * 0.0254,
      hand = inch * 4,
      foot = inch * 12,
      yard = foot * 3,
      link = chain / 100,
      rod = yard * 5.5,
      chain = rod * 4,
      furlong = chain * 10,
      mile = meter * 1609.344,

      // US maritime
      fathom = foot * 6,
      cable = nauticalMile / 10,
      nauticalMile = meter * 1852,

      // Space
      lunarDistance = kilometer * 384400,
      astronomicalUnit = meter * 149597870700,
      lightYear = meter * 9460730472580800,
      parsec = astronomicalUnit * (648000 / pi);

  Area rectangularAreaWith(Length other) =>
      Area.squareMeters(_value * other._value);

  operator *(num x) => Length.meters(_value * x);
  operator /(num x) => Length.meters(_value / x);
}
