/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The closurization of constructor f of type T is defined to be
 * equivalent to:
 * • (r1, . . . , rn , {p1 : d1, . . . , pk : dk }) {
 * return new T.m(r1, . . . , rn , p1 : p1, . . . , pk : pk );
 * }
 * if f is a named constructor with name m that has required parameters
 * r1, . . . , rn , and named parameters p1 , . . . , pk with defaults
 * d1, . . . , dk
 *
 * @description Check that closurization of a named constructor with name m
 * that has required parameters r1, . . . , rn , and named parameters
 * p1 , . . . , pk with defaults d1, . . . , dk is equivalent to
 * (r1, . . . , rn , {p1 : d1, . . . , pk : dk }) {
 * return new T.m(r1, . . . , rn, p1 : p1, . . . , pk : pk );
 * }
 *
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class C {
  double value;

  C.m(int r1, int r2, double r3, {p1: 2, p2: -3, p3: -7}) {
    value = r1 * r2 * r3 * p1 * p2 * p3;
  }
}

main() {
  var f1 = new C#m;

  var f2 = (int r1, int r2, double r3, {p1: 2, p2: -3, p3: -7}) {
    return new C.m(r1, r2, r3, p1: p1, p2: p2, p3: p3);
  };

  var o1 = f1(1, 2, 3.1, p1: 4, p2: 5, p3: 6);
  var o2 = f2(1, 2, 3.1, p1: 4, p2: 5, p3: 6);
  Expect.isTrue(o1 is C);
  Expect.isTrue(o2 is C);
  Expect.equals(o1.value, o2.value);

  o1 = f1(3, 2, 3.2, p3: 6);
  o2 = f2(3, 2, 3.2, p3: 6);
  Expect.isTrue(o1 is C);
  Expect.isTrue(o2 is C);
  Expect.equals(o1.value, o2.value);

  o1 = f1(3, 2, 3.14, p2: 6);
  o2 = f2(3, 2, 3.14, p2: 6);
  Expect.isTrue(o1 is C);
  Expect.isTrue(o2 is C);
  Expect.equals(o1.value, o2.value);

  o1 = f1(3, 2, 3.2, p3: 6, p1: 4);
  o2 = f2(3, 2, 3.2, p3: 6, p1: 4);
  Expect.isTrue(o1 is C);
  Expect.isTrue(o2 is C);
  Expect.equals(o1.value, o2.value);

  o1 = f1(3, 2, 3.4, p3: 6);
  o2 = f2(3, 2, 3.4, p3: -6);
  Expect.isTrue(o1 is C);
  Expect.isTrue(o2 is C);
  Expect.notEquals(o1.value, o2.value);
}
