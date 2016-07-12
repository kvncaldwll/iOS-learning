//: Playground - noun: a place where people can play

import UIKit

var str = "Ellow"

var str2 = str + " Govna"

for char in str2.characters {
    print("\(char) \n")
}

var toNewType = NSString(string: str2)
toNewType.substringToIndex(5)
toNewType.substringFromIndex(5)
toNewType.substringWithRange(NSRange(location: 2, length: 6 ))
toNewType.containsString("llo")
toNewType.componentsSeparatedByString("o")
toNewType.uppercaseString
toNewType.lowercaseString