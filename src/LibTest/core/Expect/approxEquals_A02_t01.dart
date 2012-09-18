/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void approxEquals(num expected, num actual, [num tolerance = null, String reason = null])
 * If no tolerance is given, tolerance is assumed to be the value 4 significant digits smaller than the value given for expected.  
 * @description Checks that with no tolerance specified, it is indeed assumed to be 1/10000th of [expected].
 * Zeros and infinities of both signs are tested.
 * @author rodionov
 * @reviewer varlax
 */

#import("dart:math", prefix: "Math");

main() {
  final double MIN_DOUBLE = Math.pow(2.0, -1074);
  final double NEG_MIN_DOUBLE = -1 * MIN_DOUBLE; 
  final double MAX_DOUBLE = (2 - Math.pow(2.0, -52)) * Math.pow(2.0, 1023);
  final double NEG_MAX_DOUBLE = -1 * MAX_DOUBLE; 

  Expect.approxEquals(0, 0);
  Expect.approxEquals(0, 0, reason: "");
  Expect.approxEquals(0, 0, reason: "not empty");

  Expect.approxEquals(-0.0, 0);
  Expect.approxEquals(-0.0, 0, reason: "");
  Expect.approxEquals(-0.0, 0, reason: "not empty");

  Expect.approxEquals(10000, 10001);
  Expect.approxEquals(10000, 10001, reason: "");
  Expect.approxEquals(10000, 10001, reason: "not empty");

  Expect.approxEquals(-10001, -10002);
  Expect.approxEquals(-10001, -10002, reason: "");
  Expect.approxEquals(-10001, -10002, reason: "not empty");

  check(100, 101);
  check(100, 101, "");
  check(100, 101, "not empty");

  // min double > 0 / 10000
  check(0, MIN_DOUBLE);
  check(0, MIN_DOUBLE, "");
  check(0, MIN_DOUBLE, "not empty");

  check(0, NEG_MIN_DOUBLE);
  check(0, NEG_MIN_DOUBLE, "");
  check(0, NEG_MIN_DOUBLE, "not empty");

  // inf / 10000 -> inf
  Expect.approxEquals(double.INFINITY, 0);
  Expect.approxEquals(double.INFINITY, 0, reason: "");
  Expect.approxEquals(double.INFINITY, 0, reason: "not empty");

  Expect.approxEquals(double.NEGATIVE_INFINITY, 0);
  Expect.approxEquals(double.NEGATIVE_INFINITY, 0, reason: "");
  Expect.approxEquals(double.NEGATIVE_INFINITY, 0, reason: "not empty");
}

void check(num arg1, num arg2, [String reason = null]) {
  try {
    Expect.approxEquals(arg1, arg2, reason: reason);
    throw new Exception("ExpectException expected");
  } catch (ExpectException e) {
  }
}
