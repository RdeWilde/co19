/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Positional arguments are always passed to the formal parameter in the same position.
 * @description Try to pass positional argument in different position
 * @dynamic-type-error
 * @author msyabro
 */

#import("../../../../Utils/dynamic_check.dart");

void func(int x, bool y) {}

main() {
  checkTypeError( () {
    func(true, 1);
  });
}
