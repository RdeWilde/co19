/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of e proceeds as follows:
 * If q is a non-factory constructor of an abstract class then an
 * AbstractClassInstantiationError is thrown.
 * If T is not a class accessible in the current scope, a dynamic error occurs.
 * Otherwise, if q is not defined or not accessible, a NoSuchMethodError is thrown.
 * If q has less than n positional parameters or more than n required parameters, or
 * if q lacks any of the keyword parameters {xn+1 , . . . , xn+k } a NoSuchMethodError
 * is thrown.
 * @description  Checks that AbstractClassInstantiationError is not thrown if q is
 * a factory constructor of an abstract class.
 * @author kaigorodov
 */

abstract class C {
  C.c();
  factory C() { return new D();}
}

class D extends C {
  D():super.c();
}

main() {
  new C();
}
