/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract bool contains(Pattern other, [int startIndex = 0])
 * Passing null in place of a pattern results in Error
 * @description Tries to pass null as [other] and expects an Error
 * @author msyabro
 * @reviewer rodionov
 * @needsreview undocumented
 */
import "../../../Utils/expect.dart";
 

main() {
  try {
    "string".contains(null, 0);
    Expect.fail("Error is expected");
  } on Error catch(e) {}
}
