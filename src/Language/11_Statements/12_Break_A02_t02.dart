/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let sb be a break statement. If sb is of the form break L;, then let sE
 * be the the innermost labeled statement with label L enclosing sb. If sb is of
 * the form break;, then let sE be the innermost do (11.7), for (11.5), switch
 * (11.8) or while (11.6) statement enclosing sb. It is a compile-time error if no
 * such statement sE exists within the innermost function in which sb occurs.
 * @description Checks that it is a compile-time error when a break statement of the form
 * "break L;" occurs outside of a labeled statement.
 * @compile-error
 * @author rodionov
 * @reviewer iefremov
 */

foo() {
  for(int i in [1,2]) {
    break L;
  }
}

main() {
  L: do {
    foo();
  } while(false);
}