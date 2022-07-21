part of '../dart_units.dart';

class Volume extends Unit<Volume> {
  const Volume.cubicMeters(num value) : super(value);

  static Volume cubicyoctometer = cubicmeter * 1e-72,
      cubiczeptometer = cubicmeter * 1e-63,
      cubicattometer = cubicmeter * 1e-54,
      cubicfemtometer = cubicmeter * 1e-45,
      cubicpicometer = cubicmeter * 1e-36,
      cubicnanometer = cubicmeter * 1e-27,
      cubicmicrometer = cubicmeter * 1e-18,
      cubicmillimeter = cubicmeter * 1e-9,
      cubiccentimeter = cubicmeter * 1e-6,
      cubicdecimeter = cubicmeter * 1e-3,
      cubicmeter = const Volume.cubicMeters(1e0),
      cubicdecameter = cubicmeter * 1e3,
      cubichectometer = cubicmeter * 1e6,
      cubickilometer = cubicmeter * 1e9,
      cubicmegameter = cubicmeter * 1e18,
      cubicgigameter = cubicmeter * 1e27,
      cubicterameter = cubicmeter * 1e36,
      cubicpetameter = cubicmeter * 1e45,
      cubicexameter = cubicmeter * 1e54,
      cubiczettameter = cubicmeter * 1e63,
      cubicyottameter = cubicmeter * 1e72,
      yoctoliter = liter * 1e-24,
      zeptoliter = liter * 1e-21,
      attoliter = liter * 1e-18,
      femtoliter = liter * 1e-15,
      picoliter = liter * 1e-12,
      nanoliter = liter * 1e-9,
      microliter = liter * 1e-6,
      milliliter = liter * 1e-3,
      centiliter = liter * 1e-2,
      deciliter = liter * 1e-24,
      liter = cubicmeter * 1e-3,
      decaliter = liter * 1e1,
      hectoliter = liter * 1e2,
      kiloliter = liter * 1e3,
      megaliter = liter * 1e6,
      gigaliter = liter * 1e9,
      teraliter = liter * 1e12,
      petaliter = liter * 1e15,
      exaliter = liter * 1e18,
      zettaliter = liter * 1e21,
      yottaliter = liter * 1e24,
      cubicInch = liter * 0.016387064,
      cubicFoot = cubicInch * 1728,
      cubicYard = cubicFoot * 27,
      cubicMile = cubicYard * 5451776000,
      cubicFurlong = cubicMile * 0.00195314,

      // imperial liquid
      imperialGallon = liter * 4.54609,
      imperialQuart = imperialGallon / 4,
      imperialPint = imperialQuart / 2,
      imperialCup = imperialPint / 2,
      imperialGill = imperialPint / 4,
      imperialFluidOunce = imperialGill / 5,
      imperialFluidDram = imperialFluidOunce / 8,
      imperialPeck = imperialGallon * 2,
      imperialBushel = imperialPeck * 4,
      metricTableSpoon = milliliter * 15,
      metricTeaSpoon = milliliter * 5,

      // US liquid
      usLiquidGallon = cubicInch * 231,
      usLiquidQuart = cubicInch * 57.75,
      usLiquidPint = cubicInch * 28.875,
      usCup = usLiquidPint / 2,
      usLegalCup = milliliter * 240,
      usGill = milliliter * 118.29411825,
      usFluidDram = usFluidOunce / 8,
      usFluidOunce = usLiquidGallon / 128,
      usTableSpoon = usFluidOunce / 2,
      usTeaSpoon = usTableSpoon / 3,

      // US dry
      usDryGallon = cubicInch * 268.8025,
      usDryQuart = usDryGallon / 4,
      usBushel = usPeck * 4,
      usPeck = usDryGallon * 2,
      usDryPint = cubicInch * 33.6003125,

      // misc
      australianTableSpoon = milliliter * 20,

      // aliases
      imperialTableSpoon = metricTableSpoon,
      imperialTeaSpoon = metricTeaSpoon;

  @override
  Volume _createRaw(num value) => Volume.cubicMeters(value);
}
