part of '../dart_units.dart';

// In kilograms (kg)
class Mass extends Unit<Mass> {
  //inherits the unit class
  const Mass.kilograms(num value) : super(value);

  static Mass
      // SI
      yoctogram = gram * yocto,
      zeptogram = gram * zepto,
      attogram = gram * atto,
      femtogram = gram * femto,
      picogram = gram * pico,
      nanogram = gram * nano,
      microgram = gram * micro,
      milligram = gram * milli,
      centigram = gram * centi,
      decigram = gram * deci,
      gram = kilogram / kilo,
      decagram = gram * deca,
      hectogram = gram * hecto,
      kilogram = const Mass.kilograms(1e0),
      megagram = gram * mega,
      gigagram = gram * giga,
      teragram = gram * tera,
      petagram = gram * peta,
      exagram = gram * exa,
      zettagram = gram * zetta,
      yottagram = gram * yotta,

      // non-SI
      tonne = megagram,
      kilotonne = gigagram,
      megatonne = teragram,
      gigatonne = petagram,
      teratonne = exagram,
      petatonne = zettagram,
      exatonne = yottagram,

      // US, avoirdupois
      troyGrain = milligram * 64.79891,
      avoirdupoisDram = avoirdupoisOunce / 16,
      avoirdupoisOunce = troyGrain * 437.5,
      avoirdupoisPound = troyGrain * 7000,
      usStone = avoirdupoisPound * 14,
      usQuarter = shortHundredweight / 4,
      shortHundredweight = avoirdupoisPound * 100,

      // UK
      ukStone = gram * 6350.29318,
      ukQuarter = longHundredweight / 4,
      longHundredweight = ukStone * 8,
      troyOunce = troyGrain * 480,
      troyPound = troyGrain * 5760,

      // aliases
      centalHundredweight = shortHundredweight, // british
      imperialHundredweight = longHundredweight; // british

  @override
  Mass _createRaw(num value) => Mass.kilograms(value);
}
