/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addErrorHandler(void errorHandler(var error))
 * Register an error continuation to execute if an error is found.
 * @description Checks handler invocation.
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer kaigorodov
 */


main() {
  var error = -1;
  var visited = false;
  var p = new Promise();

  p.addErrorHandler(foo(err) {
    Expect.equals(err, error);
    Expect.isFalse(visited);
    visited = true;
  });

  p.fail(error);

  Expect.isTrue(visited);
}
