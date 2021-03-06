/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int truncate()
 * Truncates the value of int.
 * @description Checks that this function returns correct value.
 * @author vasya
 * @reviewer msyabro
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(0, 0.truncate());
  Expect.equals(1, 1.truncate());
  Expect.equals(-1, -1.truncate());

  Expect.equals(15, 15.truncate());
  Expect.equals(-15, -15.truncate());

  Expect.equals(2147483647, 2147483647.truncate());
  Expect.equals(-4294967295, -4294967295.truncate());
  Expect.equals(9223372036854775807, 9223372036854775807.truncate());
  Expect.equals(18446744073709551617, 18446744073709551617.truncate());
  Expect.equals(-18446744073709551617, (-18446744073709551617).truncate());
}
