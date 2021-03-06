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
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <p>
          Test that fixed integral lengths round-trip correctly through zooming.
      </p>
      <p>
          The test queries <tt>offsetWidth</tt> and <tt>offsetHeight</tt> of a 1&times;10-pixel rectangle under zooming by a factor of <i>k</i>/100 for 100 &le; <i>k</i> &le; 200.
      </p>
      <pre id="console"></pre>
      <div id="container">
          <div id="target" style="width: 1px; height: 10px;"></div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var target = document.getElementById("target");
  var containerStyle = document.getElementById("container").style;
  var zoom;

  for (zoom = 100; zoom <= 200; zoom += 1) {
    containerStyle.setProperty("zoom", (zoom / 100).toString());
    if (target.offsetWidth != 1 || target.offsetHeight != 10) {
      if ((target.offsetWidth == 1 || target.offsetWidth == 2) && (target.offsetHeight == 10 || target.offsetHeight == 11))
        continue; // With subpixel layout and pixel snapping we extend the box with one pixel at certain zoom levels.
      testFailed("FAIL at $zoom% magnification: 1 mapped to ${target.offsetWidth} and 10 mapped to ${target.offsetHeight}.");
    }
  }
}
