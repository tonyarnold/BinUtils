//
//  main.swift
//  BinUtils
//
//  Created by Nicolas Seriot on 14/03/16.
//  Copyright © 2016 Nicolas Seriot. All rights reserved.
//

import Foundation

print("Hello, World!")

let s = String(data: unhexlify("48656C6C6F")!, encoding: NSUTF8StringEncoding)
assert(s == "Hello")

let data = "Hello".dataUsingEncoding(NSUTF8StringEncoding)!
assert(hexlify(data) == "48656c6c6f")

let a = unpack(">hBsf", unhexlify("0500 01 41 3fc00000")!)
assert(a[0] as? Int == 1280)
assert(a[1] as? Int == 1)
assert(a[2] as? String == "A")
assert(a[3] as? Double == 1.5)

let f = NSFileHandle(forReadingAtPath: "/bin/ls")!
let b = unpack("<2H", f.readDataOfLength(4))
f.closeFile()
assert(b[0] as? Int == 64207)
assert(b[1] as? Int == 65261)

let d = pack("<h2I3sf", [1, 2, 3, "asd", 0.5])
assert(d == unhexlify("0100 02000000 03000000 617364 0000003f"))

print("ok")
