# BinUtils
Swift functions to ease working with binary formats

**hexlify(data)**

- return the hexadecimal representation of the binary data
- akin to [hexlify() in Python binascii module](https://docs.python.org/2/library/binascii.html#binascii.hexlify)

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

**unpack(fmt, string)**

- unpack the string according to the given format
- akin to [unpack() in Python struct module](https://docs.python.org/2/library/struct.html#struct.unpack)

```swift
let a = unpack(">hBsf", unhexlify("050001413fc00000")!)
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
