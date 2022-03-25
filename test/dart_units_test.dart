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
  });

  test('Speed', () {
    expect(
      Speed.speedOfLight.inUnit(Speed.meterPerSecond),
      closeTo(299792458, testDelta),
    );
  });
}
