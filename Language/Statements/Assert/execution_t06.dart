/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In checked mode, execution of an assert statement assert(e);
 * proceeds as follows:
 * The conditional expression e is evaluated to an object o. If the class of o
 * is a subtype of Function then let r be the result of invoking o with no
 * arguments. Otherwise, let r be o. It is a dynamic type error if o is not of
 * type bool or of type Function, or if r is not of type bool. If r is false,
 * we say that the assertion failed. If r is true, we say that the assertion
 * succeeded. If the assertion succeeded, execution of the assert statement is
 * complete. If the assertion failed, an AssertionError is thrown.
 * @description Checks that a dynamic type error occurs if the conditional
 * expression e evaluates to a function that returns a function that returns a
 * value of type bool.
 * @static-warning
 * @author rodionov
 * @reviewer iefremov
 */

import '../../../Utils/dynamic_check.dart';

typedef bool boolfunc();

boolfunc foo() {
  return (() => true);
}

main() {
  checkTypeError(() {
    assert (foo); /// static type warning
  });
}
