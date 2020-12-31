//
//  main.swift
//  TwelveDaysOfChristmas
//
//  Created by Eneko Alonso on 12/31/20.
//
//  Challenge by Scott Smith (@scottsmithdev)
//  https://twitter.com/scottsmithdev/status/1341395333973225473
//

import Foundation

let title = "🎄🎶 The Twelve Days Of Christmas 🎶🎄"
let lyrics = [
    "On the %@ day of Christmas",
    "My true love gave to me:",
    "A partridge in a pear tree.",
    "And",
    "Two turtle doves,",
    "Three french hens,",
    "Four calling birds,",
    "Five golden rings,",
    "Six geese a-laying,",
    "Seven swans a-swimming,",
    "Eight maids a-milking,",
    "Nine ladies dancing,",
    "Ten lords a-leaping,",
    "'Leven pipers piping,",
    "Twelve drummers drumming,"
]

let lineSleep: UInt32 = 500000 // Make zero for instant print
let formatter = NumberFormatter()
formatter.numberStyle = .ordinal

print(title)
print()

for day in 1...12 {
    let ordinal = formatter.string(for: day) ?? ""
    print(String(format: lyrics[0], ordinal))
    usleep(lineSleep)
    print(lyrics[1])
    usleep(lineSleep)
    var currentLine = day + (day > 1 ? 2 : 1)
    repeat {
        print(lyrics[currentLine])
        currentLine -= 1;
        usleep(lineSleep)
    } while currentLine > 1
    print()
    usleep(3 * lineSleep)
}
