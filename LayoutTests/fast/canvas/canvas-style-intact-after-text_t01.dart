/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test that the rendering context's strokeStyle and fillStyle are
 * intact after calling strokeText() and fillText()
 */
import "dart:html";
import "dart:math" as Math;
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var ctx = createContext2d("canvas");

  ctx.fillStyle = 'red';
  ctx.fillRect(0, 0, 1, 1);

  debug("Checking initial state for sanity");
  var imageData = ctx.getImageData(0, 0, 2, 1);
  var imgdata = imageData.data;
  shouldBe(ctx.fillStyle, '#ff0000');
  shouldBe(imgdata[0], 255);
  shouldBe(imgdata[1], 0);
  shouldBe(imgdata[2], 0);
  shouldBe(imgdata[3], 255);
  shouldBe(imgdata[4], 0);
  shouldBe(imgdata[5], 0);
  shouldBe(imgdata[6], 0);
  shouldBe(imgdata[7], 0);

  debug("Calling fillText() to try and break the strokeStyle.");
  ctx.strokeStyle = 'green';
  ctx.lineWidth = 10;
  ctx.fillStyle = 'red';
  ctx.fillText("X", 0, 0);
  shouldBe(ctx.strokeStyle, '#008000');
  ctx.beginPath();
  ctx.moveTo(0, 0);
  ctx.lineTo(10, 10);
  ctx.stroke();
  imageData = ctx.getImageData(2, 2, 1, 1);
  imgdata = imageData.data;
  shouldBe(imgdata[0], 0);
  shouldBe(imgdata[1], 128);
  shouldBe(imgdata[2], 0);
  shouldBe(imgdata[3], 255);

  debug("Calling strokeText() to try and break the fillStyle.");
  ctx.strokeStyle = 'red';
  ctx.lineWidth = 100;
  ctx.fillStyle = 'green';
  ctx.strokeText("X", 0, 0);
  shouldBe(ctx.fillStyle, '#008000');
  ctx.fillRect(0, 0, 10, 10);
  imageData = ctx.getImageData(2, 2, 1, 1);
  imgdata = imageData.data;
  shouldBe(imgdata[0], 0);
  shouldBe(imgdata[1], 128);
  shouldBe(imgdata[2], 0);
  shouldBe(imgdata[3], 255);
}
