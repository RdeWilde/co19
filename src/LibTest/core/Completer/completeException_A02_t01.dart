/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void completeException(Object exception)
 * The argument [exception] should not be [:null:].
 * @description Checks that ArgumentError is thrown
 * if [exception] is [:null:].
 * @author msyabro
 * @reviewer kaigorodov
 */


main() {
  var completer = new Completer();
  var future = completer.future;

  try {
    completer.completeException(null);
    Expect.fail('ArgumentError is expected');
  } on ArgumentError catch(e) {}
}
