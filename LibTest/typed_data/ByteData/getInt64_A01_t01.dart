/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int getInt64(int byteOffset, [Endianness endian = Endianness.BIG_ENDIAN])
 * Returns the (possibly negative) integer represented by the eight bytes at
 * the specified [byteOffset] in this object, in two's complement binary
 * form. The return value will be between 2<sup>63</sup> and 2<sup>63</sup> - 1,
 * inclusive.
 * @description Checks that the correct value is returned.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var i64 = new Int64List.fromList([0, -1, 9223372036854775807, -9223372036854775808, 12, 54, 100, -23, 98, 23, 43, -15, -3]);
  var u32 = new Uint32List.fromList([0x62e7a17b, 0xf7ec7100, 0xe7180101, 0x1f83ccbb]);

  var byteDataFromI64 = new ByteData.view(i64.buffer);
  for(int i = 0; i < byteDataFromI64.lengthInBytes / Int64List.BYTES_PER_ELEMENT; ++i) {
    Expect.equals(i64[i], byteDataFromI64.getInt64(i*Int64List.BYTES_PER_ELEMENT, Endianness.LITTLE_ENDIAN));
  }

  var byteDataFromU32 = new ByteData.view(u32.buffer);
  var expectedBigEndian = [8908655946015829239, 72366452581892895];
  var expectedLittleEndian = [-581966005364350597, 2270883744532922625];
  for(int i = 0; i < byteDataFromU32.lengthInBytes / Int64List.BYTES_PER_ELEMENT; ++i) {
    Expect.equals(expectedBigEndian[i], byteDataFromU32.getInt64(i*Int64List.BYTES_PER_ELEMENT, Endianness.BIG_ENDIAN));
    Expect.equals(expectedLittleEndian[i], byteDataFromU32.getInt64(i*Int64List.BYTES_PER_ELEMENT, Endianness.LITTLE_ENDIAN));
  }
}
