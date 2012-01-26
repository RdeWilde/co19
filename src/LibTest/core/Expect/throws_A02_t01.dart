/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void throws(void f(), [_CheckExceptionFn check = null, String reason = null])
 * Descriptive error message is provided in case of failure.
 * @description Checks that message of thrown ExpectException includes 
 *              the specified reason argument if any, both when the tested method
 *              doesn't throw any exceptions and when the check function returns false.
 * @author varlax
 * @reviewer rodionov
 */

typedef bool checkFn(exception);
typedef void test();

main() {
  check(() {return;}, null, "sdsds sd dsf");
  check(() {return;}, (e) => true, "sdsds sd dsf");
  check(() {return;}, (e) => false, "sdsds sd dsf");

  check(() {throw "";}, (e) => false, "sdsds sd dsf");
}


void check(test tFun, [checkFn checkFun = null, String reason = null]) {
  try {
    Expect.throws(tFun, checkFun, reason);
    Expect.fail("ExpectException expected");
  } catch (ExpectException e) {
    if (!e.message.contains(reason, 0)) throw "reason ($reason) not mentioned in ExpectException message (" + e.message + ")";
  }
}