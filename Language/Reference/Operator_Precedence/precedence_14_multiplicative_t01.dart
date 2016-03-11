/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Description    Operator                          Associativity Precedence
 * Multiplicative *, /, ˜/, %                         Left          14
 * @description Test that '*' unary prefix operator has precedence (14).
 * Compare with Additive operators (precedence 13). Test that '*' has
 * priority higher than '+'
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(14, 2 + 3 * 4);
}