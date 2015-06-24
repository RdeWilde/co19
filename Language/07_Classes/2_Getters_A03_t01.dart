/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion getter definition that is prefixed with the static modifier defines a static
 * getter. Otherwise, it defines an instance getter. The name of the getter is given
 * by the identifier in the definition. The effect of a static getter declaration in
 * class C is to add an instance getter with the same name and signature to the
 * Type object for class C that forwards to the static getter.
 * @description Checks that non-static getter cannot be called as static one
 * @author sgrekhov
 */
import "../../Utils/expect.dart";

class C1 {
  int get g1 => 0;
  get g2 => null;
}

class C2 extends C1 {
  int get g3 => 0;
}

main() {
  try {
    var x = C1.g1;
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch (ok) {}

  try {
    var x = C1.g2;
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch (ok) {}

  try {
    var x = C2.g1;
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch (ok) {}

  try {
    var x = C2.g2;
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch (ok) {}

  try {
    var x = C2.g3;
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch (ok) {}
}
