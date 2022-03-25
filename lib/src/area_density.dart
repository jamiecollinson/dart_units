part of '../dart_units.dart';

class AreaDensity with Unit<AreaDensity> {
  @override
  final num _value; // kg/m^2

  const AreaDensity.kgsPerSquareMeter(this._value);

  AreaDensity({
    required Mass mass,
    required Area area,
  }) : _value = mass.inUnit(Mass.kilogram) / area.inUnit(Area.squareMeter);

  static AreaDensity
      // SI
      kgPerSquareMeter = const AreaDensity.kgsPerSquareMeter(1),

      // non-SI
      kgPerAcre = AreaDensity(
        mass: Mass.kilogram,
        area: Area.acre,
      ),
      tonnePerHectare = AreaDensity(
        mass: Mass.tonne,
        area: Area.hectare,
      );

  // Convenience functions
  num get inKgsPerSquareMeter => _value;
  num get inKgsPerAcre => inUnit(AreaDensity(
        mass: Mass.kilogram,
        area: Area.acre,
      ));
  num get inTonnesPerHectare => inUnit(AreaDensity(
        mass: Mass.tonne,
        area: Area.hectare,
      ));

  operator *(num x) => AreaDensity.kgsPerSquareMeter(_value * x);
  operator /(num x) => AreaDensity.kgsPerSquareMeter(_value / x);
}
