/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Uint16List.view(ByteBuffer buffer, [int byteOffset = 0, int length])
 * Throws [RangeError] if [offsetInBytes] or [length] are negative, or
 * if [offsetInBytes] + ([length] * elementSizeInBytes) is greater than
 * the length of [buffer].
 * @description Checks that [RangeError] is thrown if [offsetInBytes] +
 * ([length] * elementSizeInBytes) is greater than the length of [buffer].
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(array, offset, length) {
  var tmp = new Uint16List.fromList(array);
  var byteBuffer = tmp.buffer;
  try {
    var l = new Uint16List.view(byteBuffer, offset, length);
    Expect.fail("RangeError exception is expected");
  } on RangeError catch(ok) {
  }
}

main() {
  check([], 0, 1);
  check([0], 0, 3);
  check([0], 1, 1);
  check([100, 50], 2, 10);
  check([100, 50], 2, 10);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17], 20, 20);
}
