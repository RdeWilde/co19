/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> takeWhile(bool test(E element))
 * Returns an [Iterable] that stops once [test] is not satisfied anymore.
 * @description Checks that all first elements that satisfy test are
 * retained, and elements after that are skipped.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

pack(v) => new Float32x4.splat(v);

equal(obj1, obj2) {
  var res = obj1.equal(obj2);
  return res.flagX && res.flagY && res.flagZ && res.flagW;
}

void check(list, bool test(var element)) {
  var l = new Float32x4List.fromList(list);
  var it0=l.iterator;
  var res=l.takeWhile(test);
  var it=res.iterator;
  var skipCount=0;

// check that the beginning of a0 is identical to a
  var hasNext0=it0.moveNext();
  var len=0;
  for (;;) {
    bool hasNext=it.moveNext();
    if (!hasNext) break;
    Expect.isTrue(test(it0.current));
    Expect.isTrue(equal(it0.current, it.current));
    len++;
    hasNext0=it0.moveNext();
  }
  Expect.equals(len, res.length);

// count the rest
  while (hasNext0) {
    skipCount++;
    hasNext0=it0.moveNext();
  }

  Expect.equals(l.length, len+skipCount);
}

main() {
  var a0=[pack(1.0),pack(3.0),pack(7.0),pack(4.0),pack(5.0),pack(6.0)];
  check(a0, (var element)=>element.x==1.0);
  check(a0, (var element)=>true);
  check(a0, (var element)=>false);
  check(a0, (var element)=>element.x>4.0);
  check(a0, (var element)=>element.x<4.0);
  check(a0, (var element)=>element.x==4.0);
}
