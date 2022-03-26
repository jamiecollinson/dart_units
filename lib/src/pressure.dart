part of '../dart_units.dart';

// In pascals (Pa = N/m^2)
class Pressure extends Unit<Pressure> {
  Pressure.pascals(num value) : super(value);

  Pressure({
    required Force force,
    required Area area,
  }) : super(force._value / area._value);

  static Pressure
      // SI derived
      yoctopascal = pascal * 1e-24,
      zeptopascal = pascal * 1e-21,
      attopascal = pascal * 1e-18,
      femtopascal = pascal * 1e-15,
      picopascal = pascal * 1e-12,
      nanopascal = pascal * 1e-9,
      micropascal = pascal * 1e-6,
      millipascal = pascal * 1e-3,
      centipascal = pascal * 1e-2,
      decipascal = pascal * 1e-1,
      pascal = Pressure.pascals(1e0),
      decapascal = pascal * 1e1,
      hectopascal = pascal * 1e2,
      kilopascal = pascal * 1e3,
      megapascal = pascal * 1e6,
      gigapascal = pascal * 1e9,
      terapascal = pascal * 1e12,
      petapascal = pascal * 1e15,
      exapascal = pascal * 1e18,
      zettapascal = pascal * 1e21,
      yottapascal = pascal * 1e24,

      // non-si
      yoctobar = bar * 1e-24,
      zeptobar = bar * 1e-21,
      attobar = bar * 1e-18,
      femtobar = bar * 1e-15,
      picobar = bar * 1e-12,
      nanobar = bar * 1e-9,
      microbar = bar * 1e-6,
      millibar = bar * 1e-3,
      centibar = bar * 1e-2,
      decibar = bar * 1e-1,
      bar = pascal * 1e5,
      decabar = bar * 1e1,
      hectobar = bar * 1e2,
      kilobar = bar * 1e3,
      megabar = bar * 1e6,
      gigabar = bar * 1e9,
      terabar = bar * 1e12,
      petabar = bar * 1e15,
      exabar = bar * 1e18,
      zettabar = bar * 1e21,
      yottabar = bar * 1e24,

      //
      atmosphere = pascal * 1.01325 * 1e5,
      techAtmosphere = pascal * 9.80665 * 1e4,
      torr = pascal * 133.3224,
      poundsPerSquareInch = pascal * 6.8948 * 1e3,
      inchOfMercury = pascal * 3386.389;

  // Convenience functions
  num get inPascals => _value;
  num get inPoundsPerSquareInch => inUnit(poundsPerSquareInch);
  num get inBars => inUnit(bar);
  num get inAtmospheres => inUnit(atmosphere);

  @override
  Pressure _createRaw(num value) => Pressure.pascals(value);
}
