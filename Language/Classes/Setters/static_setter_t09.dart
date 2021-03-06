/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  It is a static warning if a class declares a static setter
 * named v= and also has a non-static member named v.
 * @description Checks that a static warning is arisen if a class has an
 * implicitly declared static setter and an instance method with the same name.
 * @compile-error
 * @static-warning
 * @issue 24573
 * @author ngl@unipro.ru
 */

class C {
  static int v;
  int v() { return 3; } /// static type warning
}

main() {
  C.v = 2;
}
