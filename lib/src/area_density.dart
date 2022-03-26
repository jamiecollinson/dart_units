part of '../dart_units.dart';

// In kilograms per meter squared (kg/m^2)
class AreaDensity extends Unit<AreaDensity> {
  const AreaDensity.kgsPerSquareMeter(num value) : super(value);

  AreaDensity({
    required Mass mass,
    required Area area,
  }) : super(mass.inUnit(Mass.kilogram) / area.inUnit(Area.squareMeter));

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
  num get inKgsPerAcre => inUnit(kgPerAcre);
  num get inTonnesPerHectare => inUnit(tonnePerHectare);

  @override
  AreaDensity _createRaw(num value) => AreaDensity.kgsPerSquareMeter(value);
}
