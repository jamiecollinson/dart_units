import 'dart:math';

import 'package:dart_units/dart_units.dart';
import 'package:test/test.dart';

const testDelta = 1e-3;

void main() {
  test('Length', () {
    const x = Length.meters(1);
    const y = Length.meters(2);
    expect(y.compareTo(x), 1);
    expect(y > x, true);
    expect(Length.angstrom.inUnit(Length.meter), 1e-10);
    expect(Length.meter.inUnit(Length.angstrom), 1e10);
    expect(
      Length.parsec.inUnit(Length.lightYear),
      closeTo(3.26156, testDelta),
    );
    expect(
      Length.mile.rectangularAreaWith(Length.mile).inUnit(Area.squareMile),
      closeTo(Area.squareMile.inUnit(Area.squareMile), testDelta),
    );
  });

  test('AreaDensity', () {
    expect(
      AreaDensity.tonnePerHectare
          .inUnit(AreaDensity(mass: Mass.kilogram, area: Area.acre)),
      closeTo(404.686, testDelta),
    );

    expect(
      (AreaDensity.kgPerAcre * 10).inTonnesPerHectare,
      closeTo(0.0247, testDelta),
    );

    expect(
      (AreaDensity.tonnePerHectare * 12).inKgsPerAcre,
      closeTo(4856.227, testDelta),
    );
  });

  test('Speed', () {
    expect(
      Speed.speedOfLight.inUnit(Speed.meterPerSecond),
      closeTo(299792458, testDelta),
    );

    expect(Speed.milePerHour.inUnit(Speed.kilometerPerHour),
        closeTo(1.609, testDelta));

    expect(
      Speed(length: Length.meter * 100, duration: const Duration.seconds(9))
          .inUnit(Speed.kilometerPerHour),
      closeTo(40, testDelta),
    );
  });

  test('Acceleration', () {
    expect(
      Acceleration(
        speed: Speed.milePerHour * 100,
        duration: Duration.hour,
      ).inUnit(Acceleration.meterPerSecondSquared),
      closeTo(0.0124178, testDelta),
    );

    expect(
      Acceleration.standardGravity.inUnit(Acceleration(
        speed: Speed.footPerSecond,
        duration: Duration.second,
      )),
      closeTo(32.174, testDelta),
    );
  });

  test('Pressure', () {
    expect(
      Pressure(force: Force.newton, area: Area.squareMeter),
      Pressure.pascal,
    );
  });

  test('Data', () {
    // base 10 (SI prefixes)
    expect(Data.bit.inBits, 1e0);
    expect(Data.bit.inUnit(Data.kilobit), 1e-3);
    expect(Data.kilobit.inUnit(Data.megabit), 1e-3);
    expect(Data.megabit.inUnit(Data.gigabit), 1e-3);
    expect(Data.gigabit.inUnit(Data.terabit), 1e-3);
    expect(Data.terabit.inUnit(Data.petabit), 1e-3);
    expect(Data.petabit.inUnit(Data.exabit), 1e-3);
    expect(Data.exabit.inUnit(Data.zettabit), 1e-3);
    expect(Data.zettabit.inUnit(Data.yottabit), 1e-3);

    expect(Data.bit.inBytes, 0.125);
    expect(Data.byte.inBytes, 1e0);

    expect(Data.byte.inUnit(Data.kilobyte), 1e-3);
    expect(Data.kilobyte.inUnit(Data.megabyte), 1e-3);
    expect(Data.megabyte.inUnit(Data.gigabyte), 1e-3);
    expect(Data.gigabyte.inUnit(Data.terabyte), 1e-3);
    expect(Data.terabyte.inUnit(Data.petabyte), 1e-3);
    expect(Data.petabyte.inUnit(Data.exabyte), 1e-3);
    expect(Data.exabyte.inUnit(Data.zettabyte), 1e-3);
    expect(Data.zettabyte.inUnit(Data.yottabyte), 1e-3);

    // base 2 (IEC prefixes)
    expect(Data.bit.inUnit(Data.kibibit), 0.0009765625);
    expect(Data.kibibit.inUnit(Data.mebibit), 0.0009765625);
    expect(Data.mebibit.inUnit(Data.gibibit), 0.0009765625);
    expect(Data.gibibit.inUnit(Data.tebibit), 0.0009765625);
    expect(Data.tebibit.inUnit(Data.pebibit), 0.0009765625);
    expect(Data.pebibit.inUnit(Data.exbibit), 0.0009765625);
    expect(Data.exbibit.inUnit(Data.zebibit), 0.0009765625);
    expect(Data.zebibit.inUnit(Data.yobibit), 0.0009765625);

    expect(Data.byte.inUnit(Data.kibibyte), 0.0009765625);
    expect(Data.kibibyte.inUnit(Data.mebibyte), 0.0009765625);
    expect(Data.mebibyte.inUnit(Data.gibibyte), 0.0009765625);
    expect(Data.gibibyte.inUnit(Data.tebibyte), 0.0009765625);
    expect(Data.tebibyte.inUnit(Data.pebibyte), 0.0009765625);
    expect(Data.pebibyte.inUnit(Data.exbibyte), 0.0009765625);
    expect(Data.exbibyte.inUnit(Data.zebibyte), 0.0009765625);
    expect(Data.zebibyte.inUnit(Data.yobibyte), 0.0009765625);
  });

  test('DataRate', () {
    // base 10 (SI prefixes)
    expect(DataRate.bitPerSecond.inBitsPerSecond, 1e0);
    expect(DataRate.bitPerSecond.inUnit(DataRate.kilobitPerSecond), 1e-3);
    expect(DataRate.kilobitPerSecond.inUnit(DataRate.megabitPerSecond), 1e-3);
    expect(DataRate.megabitPerSecond.inUnit(DataRate.gigabitPerSecond), 1e-3);
    expect(DataRate.gigabitPerSecond.inUnit(DataRate.terabitPerSecond), 1e-3);
    expect(DataRate.terabitPerSecond.inUnit(DataRate.petabitPerSecond), 1e-3);
    expect(DataRate.petabitPerSecond.inUnit(DataRate.exabitPerSecond), 1e-3);
    expect(DataRate.exabitPerSecond.inUnit(DataRate.zettabitPerSecond), 1e-3);
    expect(DataRate.zettabitPerSecond.inUnit(DataRate.yottabitPerSecond), 1e-3);

    expect(DataRate.bitPerSecond.inBytesPerSecond, 0.125);
    expect(DataRate.bytePerSecond.inBytesPerSecond, 1e0);

    expect(DataRate.bytePerSecond.inUnit(DataRate.kilobytePerSecond), 1e-3);
    expect(DataRate.kilobytePerSecond.inUnit(DataRate.megabytePerSecond), 1e-3);
    expect(DataRate.megabytePerSecond.inUnit(DataRate.gigabytePerSecond), 1e-3);
    expect(DataRate.gigabytePerSecond.inUnit(DataRate.terabytePerSecond), 1e-3);
    expect(DataRate.terabytePerSecond.inUnit(DataRate.petabytePerSecond), 1e-3);
    expect(DataRate.petabytePerSecond.inUnit(DataRate.exabytePerSecond), 1e-3);
    expect(DataRate.exabytePerSecond.inUnit(DataRate.zettabytePerSecond), 1e-3);
    expect(
        DataRate.zettabytePerSecond.inUnit(DataRate.yottabytePerSecond), 1e-3);

    // base 2 (IEC prefixes)
    expect(
        DataRate.bitPerSecond.inUnit(DataRate.kibibitPerSecond), 0.0009765625);
    expect(DataRate.kibibitPerSecond.inUnit(DataRate.mebibitPerSecond),
        0.0009765625);
    expect(DataRate.mebibitPerSecond.inUnit(DataRate.gibibitPerSecond),
        0.0009765625);
    expect(DataRate.gibibitPerSecond.inUnit(DataRate.tebibitPerSecond),
        0.0009765625);
    expect(DataRate.tebibitPerSecond.inUnit(DataRate.pebibitPerSecond),
        0.0009765625);
    expect(DataRate.pebibitPerSecond.inUnit(DataRate.exbibitPerSecond),
        0.0009765625);
    expect(DataRate.exbibitPerSecond.inUnit(DataRate.zebibitPerSecond),
        0.0009765625);
    expect(DataRate.zebibitPerSecond.inUnit(DataRate.yobibitPerSecond),
        0.0009765625);

    expect(DataRate.bytePerSecond.inUnit(DataRate.kibibytePerSecond),
        0.0009765625);
    expect(DataRate.kibibytePerSecond.inUnit(DataRate.mebibytePerSecond),
        0.0009765625);
    expect(DataRate.mebibytePerSecond.inUnit(DataRate.gibibytePerSecond),
        0.0009765625);
    expect(DataRate.gibibytePerSecond.inUnit(DataRate.tebibytePerSecond),
        0.0009765625);
    expect(DataRate.tebibytePerSecond.inUnit(DataRate.pebibytePerSecond),
        0.0009765625);
    expect(DataRate.pebibytePerSecond.inUnit(DataRate.exbibytePerSecond),
        0.0009765625);
    expect(DataRate.exbibytePerSecond.inUnit(DataRate.zebibytePerSecond),
        0.0009765625);
    expect(DataRate.zebibytePerSecond.inUnit(DataRate.yobibytePerSecond),
        0.0009765625);
  });

  test("Angle", () {
    // test mod behaviour - range is [0, 2*pi]
    expect((Angle.radian * (1 * pi)).mod(), Angle.radian * (1 * pi));
    expect((Angle.radian * (2 * pi)).mod(), Angle.radians(0));
    expect((Angle.radian * (3 * pi)).mod(), Angle.radians(1 * pi));
    expect((Angle.radian * (4 * pi)).mod(), Angle.radians(0));
    expect((Angle.radian * (-1 * pi)).mod(), Angle.radian * pi);
    expect((Angle.radian * (-2 * pi)).mod(), Angle.radians(0));
    expect((Angle.radian * (-3 * pi)).mod(), Angle.radians(pi));
    expect((Angle.radian * (-4 * pi)).mod(), Angle.radians(0));

    expect((Angle.degree * -180).mod(), Angle.degree * 180);
    expect((Angle.degree * -90).mod(), Angle.degree * 270);
    expect((Angle.degree * -270).mod(), Angle.degree * 90);

    // test mod behaviour with preserved rotation - i.e. range is [-2*pi, 2*pi]
    expect((Angle.radian * (1 * pi)).mod(preserveRotation: true),
        Angle.radian * (1 * pi));
    expect((Angle.radian * (2 * pi)).mod(preserveRotation: true),
        Angle.radians(0));
    expect((Angle.radian * (3 * pi)).mod(preserveRotation: true),
        Angle.radians(1 * pi));
    expect((Angle.radian * (4 * pi)).mod(preserveRotation: true),
        Angle.radians(0));
    expect((Angle.radian * (-1 * pi)).mod(preserveRotation: true),
        Angle.radian * (-1 * pi));
    expect((Angle.radian * (-2 * pi)).mod(preserveRotation: true),
        Angle.radians(0));
    expect((Angle.radian * (-3 * pi)).mod(preserveRotation: true),
        Angle.radians(-1 * pi));
    expect((Angle.radian * (-4 * pi)).mod(preserveRotation: true),
        Angle.radians(0));

    expect(Angle.zeptoradian.inUnit(Angle.yoctoradian), 1e3);
    expect(
        Angle.attoradian.inUnit(Angle.zeptoradian), closeTo(1000, testDelta));
    expect(
        Angle.femtoradian.inUnit(Angle.attoradian), closeTo(1000, testDelta));
    expect(
        Angle.pictoradian.inUnit(Angle.femtoradian), closeTo(1000, testDelta));
    expect(
        Angle.nanoradian.inUnit(Angle.pictoradian), closeTo(1000, testDelta));
    expect(
        Angle.microradian.inUnit(Angle.nanoradian), closeTo(1000, testDelta));
    expect(
        Angle.milliradian.inUnit(Angle.microradian), closeTo(1e3, testDelta));
    expect(Angle.radian.inUnit(Angle.milliradian), closeTo(1e3, testDelta));
    expect(Angle.radian.inUnit(Angle.centiradian), closeTo(1e2, testDelta));
    expect(Angle.radian.inUnit(Angle.deciradian), closeTo(1e1, testDelta));
    expect(Angle.radian.inUnit(Angle.radian), closeTo(1e0, testDelta));

    expect(Angle.radian.inUnit(Angle.degree),
        closeTo(57.295779513082321, testDelta));
    expect(Angle.degree.inUnit(Angle.milliradian),
        closeTo(17.453292519943295, testDelta));
    expect(Angle.arcminute.inUnit(Angle.microradian),
        closeTo(290.8882086657216, testDelta));
    expect(Angle.arcsecond.inUnit(Angle.microradian),
        closeTo(4.84813681109536, testDelta));
    expect(Angle.degree.inUnit(Angle.arcminute), closeTo(60, testDelta));
    expect(Angle.arcminute.inUnit(Angle.arcsecond), closeTo(60, testDelta));
    expect(
        Angle.arcsecond.inUnit(Angle.milliarcsecond), closeTo(1e3, testDelta));
    expect(
        Angle.arcsecond.inUnit(Angle.microarcsecond), closeTo(1e6, testDelta));
  });

  test("Volume", () {
    expect(Volume.fromSides(x: Length.meter, y: Length.meter, z: Length.meter),
        Volume.cubicmeter);
    expect(Volume.fromArea(area: Area.squareMeter, height: Length.meter * 2),
        Volume.cubicmeter * 2);

    expect(
        Volume.zeptoliter.inUnit(Volume.yoctoliter), closeTo(1e3, testDelta));
    expect(Volume.attoliter.inUnit(Volume.zeptoliter), closeTo(1e3, testDelta));
    expect(Volume.femtoliter.inUnit(Volume.attoliter), closeTo(1e3, testDelta));
    expect(Volume.picoliter.inUnit(Volume.femtoliter), closeTo(1e3, testDelta));
    expect(Volume.nanoliter.inUnit(Volume.picoliter), closeTo(1e3, testDelta));
    expect(Volume.microliter.inUnit(Volume.nanoliter), closeTo(1e3, testDelta));
    expect(
        Volume.milliliter.inUnit(Volume.microliter), closeTo(1e3, testDelta));

    expect(Volume.liter.inUnit(Volume.milliliter), closeTo(1e3, testDelta));
    expect(Volume.liter.inUnit(Volume.centiliter), closeTo(1e2, testDelta));
    expect(Volume.liter.inUnit(Volume.deciliter), closeTo(1e1, testDelta));
    expect(Volume.liter.inUnit(Volume.liter), closeTo(1e0, testDelta));
    expect(Volume.liter.inUnit(Volume.decaliter), closeTo(1e-1, testDelta));
    expect(Volume.liter.inUnit(Volume.hectoliter), closeTo(1e-2, testDelta));
    expect(Volume.liter.inUnit(Volume.kiloliter), closeTo(1e-3, testDelta));

    expect(Volume.kiloliter.inUnit(Volume.megaliter), closeTo(1e-3, testDelta));
    expect(Volume.megaliter.inUnit(Volume.gigaliter), closeTo(1e-3, testDelta));
    expect(Volume.gigaliter.inUnit(Volume.teraliter), closeTo(1e-3, testDelta));
    expect(Volume.teraliter.inUnit(Volume.petaliter), closeTo(1e-3, testDelta));
    expect(Volume.petaliter.inUnit(Volume.exaliter), closeTo(1e-3, testDelta));
    expect(Volume.exaliter.inUnit(Volume.zettaliter), closeTo(1e-3, testDelta));

    expect(Volume.cubiczeptometer.inUnit(Volume.cubicyoctometer),
        closeTo(1e9, testDelta));
    expect(Volume.cubicattometer.inUnit(Volume.cubiczeptometer),
        closeTo(1e9, testDelta));
    expect(Volume.cubicfemtometer.inUnit(Volume.cubicattometer),
        closeTo(1e9, testDelta));
    expect(Volume.cubicpicometer.inUnit(Volume.cubicfemtometer),
        closeTo(1e9, testDelta));
    expect(Volume.cubicnanometer.inUnit(Volume.cubicpicometer),
        closeTo(1e9, testDelta));
    expect(Volume.cubicmicrometer.inUnit(Volume.cubicnanometer),
        closeTo(1e9, testDelta));
    expect(Volume.cubicmillimeter.inUnit(Volume.cubicmicrometer),
        closeTo(1e9, testDelta));

    expect(Volume.cubicmeter.inUnit(Volume.cubicmillimeter),
        closeTo(1e9, testDelta));
    expect(Volume.cubicmeter.inUnit(Volume.cubiccentimeter),
        closeTo(1e6, testDelta));
    expect(Volume.cubicmeter.inUnit(Volume.cubicdecimeter),
        closeTo(1e3, testDelta));

    expect(Volume.liter.inUnit(Volume.cubicmeter), closeTo(1e-3, testDelta));
    expect(
        Volume.cubicmeter.inUnit(Volume.cubicmeter), closeTo(1e0, testDelta));
    expect(Volume.cubicmeter.inUnit(Volume.cubicdecameter),
        closeTo(1e-3, testDelta));
    expect(Volume.cubicmeter.inUnit(Volume.cubichectometer),
        closeTo(1e-6, testDelta));
    expect(Volume.cubicmeter.inUnit(Volume.cubickilometer),
        closeTo(1e-9, testDelta));

    expect(Volume.cubickilometer.inUnit(Volume.cubicmegameter),
        closeTo(1e-9, testDelta));
    expect(Volume.cubicmegameter.inUnit(Volume.cubicgigameter),
        closeTo(1e-9, testDelta));
    expect(Volume.cubicgigameter.inUnit(Volume.cubicterameter),
        closeTo(1e-9, testDelta));
    expect(Volume.cubicterameter.inUnit(Volume.cubicpetameter),
        closeTo(1e-9, testDelta));
    expect(Volume.cubicpetameter.inUnit(Volume.cubicexameter),
        closeTo(1e-9, testDelta));
    expect(Volume.cubicexameter.inUnit(Volume.cubiczettameter),
        closeTo(1e-9, testDelta));
    expect(Volume.cubiczettameter.inUnit(Volume.cubicyottameter),
        closeTo(1e-9, testDelta));

    expect(Volume.cubicFoot.inUnit(Volume.cubicInch), closeTo(1728, testDelta));
    expect(Volume.cubicFoot.inUnit(Volume.cubicFeet), closeTo(1e0, testDelta));
    expect(Volume.cubicFoot.inUnit(Volume.cubicYard),
        closeTo(0.037037037037037035, testDelta));
    expect(Volume.cubicYard.inUnit(Volume.cubicMile),
        closeTo(1.8342646506386176e-10, testDelta));
    expect(Volume.cubicYard.inUnit(Volume.cubicFurlong),
        closeTo(9.391362885602761e-8, testDelta));

    expect(Volume.liter.inUnit(Volume.imperialGallon),
        closeTo(0.21996924829908776, testDelta));
    expect(Volume.liter.inUnit(Volume.imperialQuart),
        closeTo(0.879876993196351, testDelta));
    expect(Volume.liter.inUnit(Volume.imperialPint),
        closeTo(1.759753986392702, testDelta));
    expect(Volume.liter.inUnit(Volume.imperialGill),
        closeTo(7.039015945570808, testDelta));
    expect(Volume.liter.inUnit(Volume.imperialCup),
        closeTo(3.519507972785404, testDelta));
    expect(Volume.liter.inUnit(Volume.imperialFluidOunce),
        closeTo(35.19507972785404, testDelta));
    expect(Volume.liter.inUnit(Volume.imperialFluidDram),
        closeTo(281.56063782283235, testDelta));
    expect(Volume.liter.inUnit(Volume.imperialPeck),
        closeTo(0.10998462414954388, testDelta));
    expect(Volume.liter.inUnit(Volume.imperialBushel),
        closeTo(0.02749615603738597, testDelta));

    expect(Volume.liter.inUnit(Volume.usLiquidGallon),
        closeTo(0.26417205235814845, testDelta));
    expect(Volume.liter.inUnit(Volume.usLiquidQuart),
        closeTo(1.0566882094325938, testDelta));
    expect(Volume.liter.inUnit(Volume.usLiquidPint),
        closeTo(2.1133764188651876, testDelta));
    expect(Volume.liter.inUnit(Volume.usCup),
        closeTo(4.226752837730375, testDelta));
    expect(Volume.liter.inUnit(Volume.usLegalCup),
        closeTo(4.166666666666667, testDelta));
    expect(Volume.liter.inUnit(Volume.usGill),
        closeTo(8.45350567546075, testDelta));
    expect(Volume.liter.inUnit(Volume.usTableSpoon),
        closeTo(67.628045403686, testDelta));
    expect(Volume.liter.inUnit(Volume.usTeaSpoon),
        closeTo(202.884136211058, testDelta));
    expect(Volume.liter.inUnit(Volume.usFluidDram),
        closeTo(270.512181614744, testDelta));
    expect(Volume.liter.inUnit(Volume.usFluidOunce),
        closeTo(33.814022701843, testDelta));

    expect(Volume.liter.inUnit(Volume.usDryQuart),
        closeTo(0.9080829842688559, testDelta));
    expect(Volume.liter.inUnit(Volume.usBushel),
        closeTo(0.028377593258401747, testDelta));
    expect(Volume.liter.inUnit(Volume.usPeck),
        closeTo(0.11351037303360699, testDelta));
    expect(Volume.liter.inUnit(Volume.usDryGallon),
        closeTo(0.22702074606721398, testDelta));
    expect(Volume.liter.inUnit(Volume.usDryPint),
        closeTo(1.8161659685377118, testDelta));
  });
}
