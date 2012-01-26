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
 * @compile-error
 * @description Checks that it is a compile-time error if a class type definition
 * uses square brackets instead of the curly ones. 
 * Class body is empty.
 * @author rodionov
 */

class A []

main() {
  try {
    A a = new A();
  } catch(var e) {}
}