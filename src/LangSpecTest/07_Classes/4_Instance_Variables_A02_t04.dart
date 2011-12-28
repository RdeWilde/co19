/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An instance variable declaration of one of the forms T v;, final T v;,
 * T v = e; or final T v = e; always induces an implicit getter function (7.2) with
 * signature T get v() whose invocation evaluates to the value stored in v.
 * @description Checks that a static warning is produced when assigning result of
 * T get v() invocation to a variable whose type may not be assigned to T. 
 * The variable declaration is of the form final T v = e;.
 * @static-type-error
 * @author pagolubev
 * @reviewer iefremov
 * @reviewer rodionov
 */

class A {
  final int v = null;
}

main() {
  A a = new A();
  bool b = a.v;
}