/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int toInt()
 * Returns the int value represented by this object.
 * @description Checks that this method returns correct value.
 * @author vasya
 * @reviewer msyabro
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

main() {
  check(0);
  check(2147483647);
  check(-2147483648);
  check(2147483648);
  check(-2147483646);
  check(9223372036854775807);
  check(-9223372036854775808);
  check(-18446744073709551617);
  check(-18446744073709551617 * 111111111111111111111111111);
  check(1 << 1024);
  check(1 << 1124);
  check(-(1 << 1024));
  check(-(1 << 1124));
}

void check(int x) {
  int res = x.toInt();
  Expect.isTrue(res is int);
  Expect.equals(x, res);
}
