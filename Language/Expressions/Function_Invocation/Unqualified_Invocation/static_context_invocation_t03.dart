/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An unqualified function invocation i has the form
 * id(a1, ..., an, xn+1: an+1, ..., xn+k: an+k), where id is an identifier.
 * If there exists a lexically visible declaration named id, let fid be the
 * innermost such declaration. Then:
 * . . .
 * Otherwise, if i occurs inside a top level or static function (be it function,
 * method, getter, or setter) or variable initializer, evaluation of i causes a
 * NoSuchMethodError to be thrown.
 * . . .
 * @description Checks that if there is no declaration and i occurs in static
 * function (of any kind), or static variable initializer, evaluation of i
 * causes a NoSuchMethodError to be thrown.
 * @static-warning
 * @author ilya
 */
import '../../../../Utils/expect.dart';

class C {
  static test() =>  undeclared();
  static get test2 => undeclared2();
  static set test3 (_) => undeclared3();
  static var test4 = undeclared4();

  noSuchMethod(Invocation im) {
    Expect.fail('must not be called');
  }
}

main() {
  Expect.throws(() => C.test(), (e) => e is NoSuchMethodError);
  Expect.throws(() => C.test2, (e) => e is NoSuchMethodError);
  Expect.throws(() => C.test3 = 1, (e) => e is NoSuchMethodError);
  Expect.throws(() => C.test4, (e) => e is NoSuchMethodError);
}
