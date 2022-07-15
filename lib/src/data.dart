part of '../dart_units.dart';

// In bits
class Data extends Unit<Data> {
  Data(num value) : super(value);

  static Data
      // base 10 bits (SI prefixes)
      bit = Data(1e0),
      kilobit = bit * 1e3,
      megabit = bit * 1e6,
      gigabit = bit * 1e9,
      terabit = bit * 1e12,
      petabit = bit * 1e15,
      exabit = bit * 1e18,
      zettabit = bit * 1e21,
      yottabit = bit * 1e24,

      // base 10 bytes
      byte = bit * 8,
      kilobyte = byte * 1e3,
      megabyte = byte * 1e6,
      gigabyte = byte * 1e9,
      terabyte = byte * 1e12,
      petabyte = byte * 1e15,
      exabyte = byte * 1e18,
      zettabyte = byte * 1e21,
      yottabyte = byte * 1e24,

      // base 2 bits (iec prefixes)
      kibibit = bit * 1024,
      mebibit = kibibit * 1024,
      gibibit = mebibit * 1024,
      tebibit = gibibit * 1024,
      pebibit = tebibit * 1024,
      exbibit = pebibit * 1024,
      zebibit = exbibit * 1024,
      yobibit = zebibit * 1024,

      // base 2 bytes
      kibibyte = byte * 1024,
      mebibyte = kibibyte * 1024,
      gibibyte = mebibyte * 1024,
      tebibyte = gibibyte * 1024,
      pebibyte = tebibyte * 1024,
      exbibyte = pebibyte * 1024,
      zebibyte = exbibyte * 1024,
      yobibyte = zebibyte * 1024;

  // Convenience functions
  num get inBits => _value;
  num get inBytes => inUnit(byte);
  num get inKilobytes => inUnit(kilobyte);
  num get inMegabytes => inUnit(megabyte);
  num get inGigabytes => inUnit(gigabyte);
  num get inTerabytes => inUnit(terabyte);

  @override
  Data _createRaw(num value) => Data(value);
}
