/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Uri.http(String authority, String unencodedPath,
 * [Map<String, String> queryParameters])
 * Creates a new http URI from authority, path and query.
 * The path component is set from the unencodedPath argument. The path passed
 * must not be encoded as this constructor encodes the path.
 * @description Checks expected path settings
 * @author ilya
 * @reviewer
 */

import "../../../Utils/expect.dart";

main() {
  var x = new Uri.http('', 'foo/bar');
  Expect.equals('foo/bar', x.path);

  x = new Uri.http('', '/foo/\u0000/\u0001');
  Expect.equals('/foo/%00/%01', x.path);
}

