part of '../dart_units.dart';

// In seconds (s)
class Duration extends Unit<Duration> {
  const Duration.seconds(num value) : super(value);

  static Duration
      // SI
      yoctosecond = second * 1e-24,
      zeptosecond = second * 1e-21,
      attosecond = second * 1e-18,
      femtosecond = second * 1e-15,
      picosecond = second * 1e-12,
      nanosecond = second * 1e-9,
      microsecond = second * 1e-6,
      millisecond = second * 1e-3,
      centisecond = second * 1e-2,
      decisecond = second * 1e-1,
      second = const Duration.seconds(1e0),
      decasecond = second * 1e1,
      hectosecond = second * 1e2,
      kilosecond = second * 1e3,
      megasecond = second * 1e6,
      gigasecond = second * 1e9,
      terasecond = second * 1e12,
      petasecond = second * 1e15,
      exasecond = second * 1e18,
      zettasecond = second * 1e21,
      yottasecond = second * 1e24,

      // non-SI
      minute = second * 60,
      hour = minute * 60,
      day = hour * 24,
      week = day * 7,
      thirtyDayMonth = day * 30,
      julianYear = day * 365.25;

  @override
  Duration _createRaw(num value) => Duration.seconds(value);
}
