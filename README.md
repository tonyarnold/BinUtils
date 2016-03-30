# BinUtils
Swift functions to ease working with binary formats

**hexlify(data)**

- return the hexadecimal representation of the binary data
- akin to [hexlify() in Python binascii module](https://docs.python.org/2/library/binascii.html#binascii.hexlify)
- for iOS and OS X

```swift
let data = "Hello".dataUsingEncoding(NSUTF8StringEncoding)!
assert(hexlify(data) == "48656C6C6F")
```

**unhexlify(hexstr)**

- return the binary data represented by the hexadecimal string hexstr
- akin to [unhexlify() in Python binascii module](https://docs.python.org/2/library/binascii.html#binascii.unhexlify)

```swift
let s = String(data: unhexlify("48656C6C6F")!, encoding: NSUTF8StringEncoding)
assert(s == "Hello")
```

**pack(fmt, [v2, v2, ...])**

- return a string containing the values v1, v2, ... packed according to the given format
- akin to [pack() in Python struct module](https://docs.python.org/2/library/struct.html#struct.pack)

```swift
let d = pack("<h2I3sf", [1, 2, 3, "asd", 0.5])
assert(d == unhexlify("0100 02000000 03000000 617364 0000003f"))
```

**unpack(fmt, string)**

- unpack the string according to the given format
- akin to [unpack() in Python struct module](https://docs.python.org/2/library/struct.html#struct.unpack)

```swift
let a = unpack(">hBsf", unhexlify("0500 01 41 3fc00000")!)
assert(a[0] as? Int == 1280)
assert(a[1] as? Int == 1)
assert(a[2] as? String == "A")
assert(a[3] as? Double == 1.5)
```

```swift
let f = NSFileHandle(forReadingAtPath: "/bin/ls")!
let b = unpack("<2H", f.readDataOfLength(4))
f.closeFile()
assert(b[0] as? Int == 64207)
assert(b[1] as? Int == 65261)
```
