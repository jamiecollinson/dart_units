part of '../dart_units.dart';

abstract class Unit<T extends Unit<T>> implements Comparable<Unit> {
  num get _value;

  @override
  int compareTo(other) {
    if (_value == other._value) return 0;
    return (_value > other._value) ? 1 : -1;
  }

  num inUnit(T other) => _value / other._value;

  @override
  operator ==(other) => (other is T) ? compareTo(other) == 0 : false;

  operator >(T other) => compareTo(other) > 0;
  operator >=(T other) => compareTo(other) >= 0;
}
