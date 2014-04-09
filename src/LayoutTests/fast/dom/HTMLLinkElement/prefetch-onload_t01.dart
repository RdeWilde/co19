/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that onload events can be attached to link elements
 * with rel=prefetch. Since prefetch links are just there as a performance 
 * optimization, the onload event is their only programatic side-effect.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../../Utils/async_utils.dart";
import "../../../testcommon.dart";

main() {
  var root = '/root_dart/tests/co19/src/LayoutTests/fast/dom/HTMLLinkElement';

  document.body.setInnerHtml('''
    <link href="$root/prefetch.link" rel="prefetch">
    ''', treeSanitizer: new NullTreeSanitizer());

  var link = document.body.querySelector('link');

  link.onLoad.listen((_) => asyncEnd());

  asyncStart();
}