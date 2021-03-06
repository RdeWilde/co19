/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a property extraction i of the form super#m
 * proceeds as follows:
 * ...
 * Let Sstatic be the superclass of the immediately enclosing class. It is a
 * static type warning if Sstatic does not have an accessible instance member
 * named m.
 *
 * @description Check that it is a static type warning if S does not have an
 * accessible instance member named m but has abstract getter only
 * @static-warning
 * @author sgrekhov@unipro.ru
 */

class A {
  int get m;
}

class C extends A {
  int get m => 1;

  void test() {
    try {
      super#m;  /// static type warning
    } on NoSuchMethodError {}
  }
}

main() {
  C c = new C();
  c.test();
}
