/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests accessing entries does not crash when input type is
 * not file
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <input name="input" id="input"></input>
      ''', treeSanitizer: new NullTreeSanitizer());

  var input = document.body.query('input');
  shouldEvaluateTo(input.entries.length, 0);
}
