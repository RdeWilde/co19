/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a property extraction i of the form e#m proceeds as
 * follows:
 * ...
 * If method lookup failed, let f be the result of looking up getter m in o
 * with respect to the current library L. If o is an instance of Type but e is
 * not a constant type literal, then if f is a method that forwards to a static
 * getter, getter lookup fails. If getter lookup succeeds then i evaluates to
 * the closurization of getter f on object o. If getter lookup failed, a
 * NoSuchMethodError is thrown.
 *
 * @description Check that if there are getter named m in the class then getter
 * lookup succeeds even if there are setter m as well
 *
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class C {
  void set m(int val) {}
  int get m => 1;
}

main() {
  var o = new C();
  var x = o#m;
  Expect.equals(1, x());
}
