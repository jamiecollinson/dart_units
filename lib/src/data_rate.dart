part of '../dart_units.dart';

// In bits per second, bit/s
class DataRate extends Unit<DataRate> {
  DataRate.bitsPerSecond(num value) : super(value);

  DataRate({
    required Data data,
    required Duration duration,
  }) : super(data.inBits / duration.inUnit(Duration.second));

  static DataRate
      // base 10 bits (SI prefixes)
      bitPerSecond = DataRate.bitsPerSecond(1e0),
      kilobitPerSecond =
          DataRate(data: Data.kilobit, duration: Duration.second),
      megabitPerSecond =
          DataRate(data: Data.megabit, duration: Duration.second),
      gigabitPerSecond =
          DataRate(data: Data.gigabit, duration: Duration.second),
      terabitPerSecond =
          DataRate(data: Data.terabit, duration: Duration.second),
      petabitPerSecond =
          DataRate(data: Data.petabit, duration: Duration.second),
      exabitPerSecond = DataRate(data: Data.exabit, duration: Duration.second),
      zettabitPerSecond =
          DataRate(data: Data.zettabit, duration: Duration.second),
      yottabitPerSecond =
          DataRate(data: Data.yottabit, duration: Duration.second),

      // base 10 bytes
      bytePerSecond = DataRate(data: Data.byte, duration: Duration.second),
      kilobytePerSecond =
          DataRate(data: Data.kilobyte, duration: Duration.second),
      megabytePerSecond =
          DataRate(data: Data.megabyte, duration: Duration.second),
      gigabytePerSecond =
          DataRate(data: Data.gigabyte, duration: Duration.second),
      terabytePerSecond =
          DataRate(data: Data.terabyte, duration: Duration.second),
      petabytePerSecond =
          DataRate(data: Data.petabyte, duration: Duration.second),
      exabytePerSecond =
          DataRate(data: Data.exabyte, duration: Duration.second),
      zettabytePerSecond =
          DataRate(data: Data.zettabyte, duration: Duration.second),
      yottabytePerSecond =
          DataRate(data: Data.yottabyte, duration: Duration.second),

      // base 2 bits (iec prefixes)
      kibibitPerSecond =
          DataRate(data: Data.kibibit, duration: Duration.second),
      mebibitPerSecond =
          DataRate(data: Data.mebibit, duration: Duration.second),
      gibibitPerSecond =
          DataRate(data: Data.gibibit, duration: Duration.second),
      tebibitPerSecond =
          DataRate(data: Data.tebibit, duration: Duration.second),
      pebibitPerSecond =
          DataRate(data: Data.pebibit, duration: Duration.second),
      exbibitPerSecond =
          DataRate(data: Data.exbibit, duration: Duration.second),
      zebibitPerSecond =
          DataRate(data: Data.zebibit, duration: Duration.second),
      yobibitPerSecond =
          DataRate(data: Data.yobibit, duration: Duration.second),

      // base 2 bytes
      kibibytePerSecond =
          DataRate(data: Data.kibibyte, duration: Duration.second),
      mebibytePerSecond =
          DataRate(data: Data.mebibyte, duration: Duration.second),
      gibibytePerSecond =
          DataRate(data: Data.gibibyte, duration: Duration.second),
      tebibytePerSecond =
          DataRate(data: Data.tebibyte, duration: Duration.second),
      pebibytePerSecond =
          DataRate(data: Data.pebibyte, duration: Duration.second),
      exbibytePerSecond =
          DataRate(data: Data.exbibyte, duration: Duration.second),
      zebibytePerSecond =
          DataRate(data: Data.zebibyte, duration: Duration.second),
      yobibytePerSecond =
          DataRate(data: Data.yobibyte, duration: Duration.second);

  // Convenience functions
  num get inBitsPerSecond => _value;
  num get inKilobitsPerSecond => inUnit(kilobitPerSecond);
  num get inMegabitsPerSecond => inUnit(megabitPerSecond);
  num get inGigabitsPerSecond => inUnit(gigabitPerSecond);
  num get inTerabitsPerSecond => inUnit(terabitPerSecond);

  num get inBytesPerSecond => inUnit(bytePerSecond);
  num get inKilobytesPerSecond => inUnit(kilobytePerSecond);
  num get inMegabytesPerSecond => inUnit(megabytePerSecond);
  num get inGigabytesPerSecond => inUnit(gigabytePerSecond);
  num get inTerabytesPerSecond => inUnit(terabytePerSecond);

  @override
  DataRate _createRaw(num value) => DataRate.bitsPerSecond(value);
}
