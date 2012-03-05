/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let T be the static type of o. If T.m
 * does not exist, or if F is not a function type, the static type of i is Dynamic;
 * otherwise:
 *  the static type of i is the declared return type of F.
 *  Let Ti be the static type of ai, i from 1 to n + k. It is a static warning if F is
 * not a supertype of (T1, ... , Tn; [Tn+1 xn+1, ... , Tn+k xn+k]) -> ⊥.
 * @description Checks that the static type of a method invocation is the declared return type of F.
 * @author msyabro
 */

class C {
  int f1() {}
  bool f2() {}
  String f3() {}
  C f4() {}
}

main() {
  C o = new C();
  int resultInt = o.f1();
  bool resultBool = o.f2();
  String resultString = o.f3();
  C resultC = o.f4();
}
