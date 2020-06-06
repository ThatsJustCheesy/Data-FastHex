# Data+FastHex
## Fast hexadecimal string encoding/decoding for Swift's `Data` and `NSData`

Data+FastHex extends `Data` and `NSData` to convert to and from a hexadecimal
string representation. As the name implies, it has a focus on performance,
without sacrificing code clarity.

Other implementations found online perform multiple message sends per byte and
make additional copies of data buffers, which is wasteful.

### Optimization techniques

* `CFStringInlineBuffer` for efficient character access (fast enumeration of
  string characters)
* `-[NSData enumerateByteRangesUsingBlock:]` to avoid an extra copy of the
  NSData buffer if the data isn't contiguous
* `-initWithBytesNoCopy:…` to avoid an extra copy of the encoded and decoded
  data and string buffers

## Origin

This is an adaptation of the original [NSData+FastHex library](https://github.com/jmah/NSData-FastHex) by [Jonathan Mah](https://github.com/jmah), me@JonathonMah.com. Jonathan owns most of the copyright, but makes it available under the MIT License. I added Swift Package Manager support and convenience methods that operate on Swift's `Data` type. My modifications are also available under the MIT License.

[The original](https://github.com/jmah/NSData-FastHex) is available through CocoaPods, so if you want that instead of SwiftPM, then by all means, use it.

## Install

### Swift Package Manager

Add to your Package.swift:

```swift
.package(url: "https://github.com/ThatsJustCheesy/Data-FastHex", from: "2.0.0")
```

or do the equivalent in Xcode. The product name to specify as a target dependency is `"Data-FastHex"`.

## Use

```swift
import Data_FastHex

let bytes: [UInt8] = [0xDE, 0xAD, 0xBE, 0xEF, 0x42]
let data = Data(bytes: bytes, count: bytes.count)
let hexString = data.hexStringRepresentation // => "DEADBEEF42"
let decoded = Data(hexString: hexString)
```

## Authors

- Original library, actual bulk of the code: [Jonathon Mah](https://github.com/jmah), me@JonathonMah.com
- SwiftPM interface: [Ian Gregory](https://github.com/ThatsJustCheesy)

## License

Data+FastHex is available under the MIT license. See the LICENSE file for more info.
