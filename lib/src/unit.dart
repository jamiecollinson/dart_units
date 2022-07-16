part of '../dart_units.dart';

abstract class Unit<T extends Unit<T>> implements Comparable<Unit> {
  final num _value; // Unit's [_value] in base (SI) units

  const Unit(this._value);

  @override
  int compareTo(other) {
    if (_value == other._value) return 0;
    return (_value > other._value) ? 1 : -1;
  }

  num inUnit(T other) => _value / other._value;

  @override
  bool operator ==(other) => (other is T) ? compareTo(other) == 0 : false;

  @override
  int get hashCode => _value.hashCode;

  @override
  String toString() => _value.toString();

  bool operator >(T other) => compareTo(other) > 0;
  bool operator >=(T other) => compareTo(other) >= 0;
  bool operator <(T other) => compareTo(other) < 1;
  bool operator <=(T other) => compareTo(other) <= 0;

  T _createRaw(num value);
  T operator *(num x) => _createRaw(_value * x);
  T operator /(num x) => _createRaw(_value / x);
  T operator +(T other) => _createRaw(_value + other._value);
  T operator -(T other) => _createRaw(_value - other._value);
}
