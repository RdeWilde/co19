/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns a new list with the elements of this list that satisfy the predicate [f].
 * @description Checks that all elements of the returned list satisfy the predicate [f].
 * @author vasya
 * @reviewer iefremov
 */


void arrayEquals(List expected, List actual) {
  Expect.isTrue(expected.length == actual.length);
  for(var i = 0; i < expected.length; i+=1) {
    Expect.isTrue(expected[i] === actual[i]);
    Expect.isTrue(expected[i] == actual[i]);
  }
}

main() {
  bool f(int e) { return (e > 1); }
  List a = [-1,0,1,2,3,4].filter(f);
  for(var i = 0; i < a.length; i++) {
    Expect.isTrue(f(a[i]));
  }
  arrayEquals([2,3,4], a);

  bool f1(Object e) { return (e == null); } 
  List b = [null,[null],"",0,[0,1,2], null];
  a = b.filter(f1);
  for(var i = 0; i < a.length; i++) {
    Expect.isTrue(f1(a[i]));
  }
  arrayEquals([null, null], a);

  bool f2(String e) { return (e == "list"); }
  b = new List<String>(534768);
  b[53478] = "list";
  a = b.filter(f2);
  for(var i = 0; i < a.length; i++) {
    Expect.isTrue(f2(a[i]));
  }
  arrayEquals(["list"], a);

  bool f3(String e) { return (e.isEmpty()); } 
  a = ["1","2","3"].filter(f3);
  Expect.isTrue(a.length == 0);
  Expect.isTrue(a.isEmpty());
}