/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion classDefinition:
 * class identifier typeParameters? superclass? interfaces?
 *   '{' classMemberDefinition* '}'
 * ;
 * @description Checks that various class definitions that are valid according to
 * this syntax do not cause any errors and can be instantiated.
 * @author msyabro
 * @reviewer rodionov
 */

interface I {}
interface J {}
interface IT <T> {}

class A {}
class B extends A {}
class C extends B implements I {}
class D implements I, J {}
class E extends D implements I, J {}

class F<T> {}
class G<S, T> extends F<T> {}
class H<T> implements I {}
class K extends G<int, int> implements I {}
class L<T extends A, S extends B> implements IT<T> {}

main() {
  A a = new A();
  B b = new B();
  C c = new C();
  D d = new D();
  E e = new E();
  F f = new F();
  G g = new G();
  H h = new H();
  K k = new K();
  L l = new L();
}