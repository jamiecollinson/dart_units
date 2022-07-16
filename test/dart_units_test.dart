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
}
