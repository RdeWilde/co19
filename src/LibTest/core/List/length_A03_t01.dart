/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If [newLength] is less than the current [length], drops extra entries 
 * at the end of this list.
 * @description Checks that entries are deleted from the list end.
 * @author varlax
 * @reviewer msyabro
 */

main() {
  var a = new List.from([0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17]);
  a.length = 10;
  Expect.listEquals([0,1,2,3,4,5,6,7,8,9], a);


  List<int> b = new List.from([0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17]).getRange(5,10);
  Expect.listEquals([5,6,7,8,9,10,11,12,13,14], b);
}