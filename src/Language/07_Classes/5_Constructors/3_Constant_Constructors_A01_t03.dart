/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion constantConstructorSignature: const qualified formalParameterList ;
 * @description Checks that it is a compile-time error if the constructor formal
 * parameters are missing.
 * @author iefremov
 * @reviewer rodionov
 * @compile-error
 */

class A {
  const A;
}

main() {
  try {
    var a = const A();
  } catch(var x){}
}