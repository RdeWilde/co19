/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if any default values are specified in
 * the signature of function type alias.
 * @description Checks that a compile error is produced when a default value is
 * specified for an optional named argument in a function type alias.
 * @compile-error
 * @author iefremov
 * @reviewer rodionov
 */
import '../../../../Utils/expect.dart';

typedef F({var a: null});

main() {
  Expect.isFalse(() {} is F);}
