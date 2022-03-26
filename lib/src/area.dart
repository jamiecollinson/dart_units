part of '../dart_units.dart';

// In square meters (m^2)
class Area extends Unit<Area> {
  Area.squareMeters(num value) : super(value);

  Area.fromSideLengths({
    required Length x,
    required Length y,
  }) : super(x.inUnit(Length.meter) * y.inUnit(Length.meter));

  static Area
      // SI
      squareYoctometer = squareMeter * 1e-48,
      squareZeptometer = squareMeter * 1e-42,
      squareAttometer = squareMeter * 1e-36,
      squareFemtometer = squareMeter * 1e-30,
      squarePicometer = squareMeter * 1e-24,
      squareNanometer = squareMeter * 1e-18,
      squareMicrometer = squareMeter * 1e-12,
      squareMillimeter = squareMeter * 1e-6,
      squareCentimeter = squareMeter * 1e-4,
      squareDecimeter = squareMeter * 1e-2,
      squareMeter = Area.squareMeters(1),
      squareDecameter = squareMeter * 1e2,
      squareHectometer = squareMeter * 1e4,
      squareKilometer = squareMeter * 1e6,
      squareMegameter = squareMeter * 1e12,
      squareGigameter = squareMeter * 1e18,
      squareTerameter = squareMeter * 1e24,
      squarePetameter = squareMeter * 1e30,
      squareExameter = squareMeter * 1e36,
      squareZettameter = squareMeter * 1e42,
      squareYottameter = squareMeter * 1e48,

      // US
      squareInch = squareMeter * 0.00064516,
      squareFoot = squareInch * 144,
      squareYard = squareFoot * 9,
      acre = squareYard * 4840,
      squareMile = acre * 640,

      // TW
      //1坪(twPing)= 3.30579 平方公尺
      //1公頃(hectare,twGongQing)= 10000 平方公尺
      //1甲(twJia)= 2934*3.30579 平方公尺
      //1分(twFen)= 293.4*3.30579 平方公尺
      twGongQing = squareMeter * 10000,
      twPing = squareMeter / 3.30579,
      twFen = squareMeter / (293.4 * 3.30579),
      twJia = squareMeter / (2934 * 3.30579),

      // imperial
      squareRod = squareFoot * 272.25,
      rood = squareYard * 1210,

      // aliases
      centiare = squareMeter,
      are = squareDecameter,
      hectare = squareHectometer,
      squarePerch = squareRod;

  @override
  Area _createRaw(num value) => Area.squareMeters(value);
}
