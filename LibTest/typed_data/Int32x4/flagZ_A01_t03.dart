/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final bool flagZ
 * Extracted [z] value. Returns false for 0, true for any other value.
 * @description Checks that [flagZ] is final and can't be set.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var obj = new Int32x4.bool(false, false, false, false);
  try {
    obj.flagZ = true;
    Expect.fail("[flagZ] should be final");
  } on NoSuchMethodError catch(ok) {}
}
