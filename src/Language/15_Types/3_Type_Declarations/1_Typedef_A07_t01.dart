/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Any self reference in a typedef, either directly, or recursively
 * via another typedef, is a compile time error.
 * @description Checks that self-referencing typedef is not allowed (return value type annotation has the same
 * name as the type alias).
 * @compile-error
 * @author msyabro
 * @reviewer iefremov
 */

typedef f f();

main() {
  try {
    null is f;
  } catch(x) {}
}
