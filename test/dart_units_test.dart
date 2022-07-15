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
      Speed(length: Length.meter * 100, duration: Duration.seconds(9))
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
}
