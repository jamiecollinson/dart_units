part of '../dart_units.dart';

class Mass with Unit<Mass> {
  @override
  final num _value; // kg

  const Mass.kilograms(this._value);

  static Mass
      // SI
      yoctogram = gram * 1e-24,
      zeptogram = gram * 1e-21,
      attogram = gram * 1e-18,
      femtogram = gram * 1e-15,
      picogram = gram * 1e-12,
      nanogram = gram * 1e-9,
      microgram = gram * 1e-6,
      milligram = gram * 1e-3,
      centigram = gram * 1e-2,
      decigram = gram * 1e-1,
      gram = kilogram * 1e-3,
      decagram = gram * 1e1,
      hectogram = gram * 1e2,
      kilogram = const Mass.kilograms(1e0),
      megagram = gram * 1e6,
      gigagram = gram * 1e9,
      teragram = gram * 1e12,
      petagram = gram * 1e15,
      exagram = gram * 1e18,
      zettagram = gram * 1e21,
      yottagram = gram * 1e24,

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

  operator *(num x) => Mass.kilograms(_value * x);
  operator /(num x) => Mass.kilograms(_value / x);
}
