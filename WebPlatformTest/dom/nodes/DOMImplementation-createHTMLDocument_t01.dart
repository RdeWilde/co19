/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
/*
 * after web-platform-tests/dom/nodes/DOMImplementation-createHTMLDocument.html
 * <link rel=help href="http://dom.spec.whatwg.org/#dom-domimplementation-createhtmldocument">
 *
 * @assertion DOMImplementation.createHTMLDocument
 *
 * @description 
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void checkDoc(title, expectedtitle, normalizedtitle) {
  test(() {
    var doc = document.implementation.createHTMLDocument(title);
    assert_equals(doc.doctype.name, "html")
    assert_equals(doc.doctype.publicId, "")
    assert_equals(doc.doctype.systemId, "")
    assert_equals(doc.documentElement.localName, "html")
    assert_equals(doc.documentElement.firstChild.localName, "head")
    if (title !== undefined) {
      assert_equals(doc.documentElement.firstChild.childNodes.length, 1)
      assert_equals(doc.documentElement.firstChild.firstChild.localName, "title")
      assert_equals(doc.documentElement.firstChild.firstChild.firstChild.data,
                    expectedtitle)
    } else {
      assert_equals(doc.documentElement.firstChild.childNodes.length, 0)
    }
    assert_equals(doc.documentElement.lastChild.localName, "body")
    assert_equals(doc.documentElement.lastChild.childNodes.length, 0)
  })
}

void main() {

checkDoc("", "", "")
checkDoc(null, "null", "null")
checkDoc(undefined, "", "")
checkDoc("foo  bar baz", "foo  bar baz", "foo bar baz")
checkDoc("foo\t\tbar baz", "foo\t\tbar baz", "foo bar baz")
checkDoc("foo\n\nbar baz", "foo\n\nbar baz", "foo bar baz")
checkDoc("foo\f\fbar baz", "foo\f\fbar baz", "foo bar baz")
checkDoc("foo\r\rbar baz", "foo\r\rbar baz", "foo bar baz")

test(() {
  var doc = document.implementation.createHTMLDocument();
    assert_equals(doc.doctype.name, "html")
    assert_equals(doc.doctype.publicId, "")
    assert_equals(doc.doctype.systemId, "")
    assert_equals(doc.documentElement.localName, "html")
    assert_equals(doc.documentElement.firstChild.localName, "head")
    assert_equals(doc.documentElement.firstChild.childNodes.length, 0)
    assert_equals(doc.documentElement.lastChild.localName, "body")
    assert_equals(doc.documentElement.lastChild.childNodes.length, 0)
}, "Missing title argument");

checkTestFailures();
}
