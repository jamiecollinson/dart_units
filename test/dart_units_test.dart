import 'dart:math';

import 'package:dart_units/dart_units.dart';
import 'package:flutter_test/flutter_test.dart';

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
  });
}
