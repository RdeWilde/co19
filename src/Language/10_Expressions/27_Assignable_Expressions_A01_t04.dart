/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Assignable expressions are expressions that can appear on the left hand side of
 * an assignment.
 * assignableExpression:
 *   primary (arguments* assignableSelector)+ |
 *   super assignableSelector |
 *   identifier
 * ;
 * assignableSelector:
 *   '[' expression ']' |
 *   '.' identifier
 * ;
 * primary:
 *   thisExpression |
 *   super assignableSelector |
 *   functionExpression |
 *   literal |
 *   identifier |
 *   newExpression |
 *   constantObjectExpression |
 *   '(' expression ')'
 * ;
 * literal:
 *   nullLiteral |
 *   booleanLiteral |
 *   numericLiteral |
 *   stringLiteral |
 *   mapLiteral |
 *   listLiteral
 * ;
 * @description Checks that super without assignableSelector can't
 * be used in the left hand side of an assignment.
 * @compile-error
 * @author msyabro
 * @reviewer kaigorodov
 */

class S {}
class A extends S {
  test() {
    try {
      super = null;
    } catch(var e) {}
  }
}

main() {
  A a = new A();
  a.test();
}