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

let a = unpack(">hBsf", unhexlify("050001413fc00000")!)
assert(a[0] as? Int == 1280)
assert(a[1] as? Int == 1)
assert(a[2] as? String == "A")
assert(a[3] as? Double == 1.5)

let f = NSFileHandle(forReadingAtPath: "/bin/ls")!
let b = unpack("<2H", f.readDataOfLength(4))
f.closeFile()
assert(b[0] as? Int == 64207)
assert(b[1] as? Int == 65261)

print("ok")
