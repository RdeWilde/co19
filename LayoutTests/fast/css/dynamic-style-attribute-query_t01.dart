/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <div id="testDiv">
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  document.getElementById('testDiv').style.top = '0';
  shouldNotBe(document.querySelector('#testDiv[style]'), null);
}
