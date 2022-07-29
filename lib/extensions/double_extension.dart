part of '../streamable.dart';

extension StreamableDoubleExtension on Streamable<double> {
  /// Addition operator
  double operator +(num other) {
    return value + other;
  }

  /// Subtraction operator
  double operator -(num other) {
    return value - other;
  }

  /// Multiplication operator
  double operator *(num other) {
    return value * other;
  }

  /// Division operator
  double operator /(num other) {
    return value / other;
  }
}
