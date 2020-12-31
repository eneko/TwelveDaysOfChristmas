# Twelve Days Of Christmas

TwelveDaysOfChristmas

 Created by Eneko Alonso on 12/31/20

Challenge by [Scott Smith (@scottsmithdev)](https://twitter.com/scottsmithdev/status/1341395333973225473)

## The Lyrics

I found the lyrics on the internet, might not be exact punctuation, casing, etc.

```
🎄🎶 The Twelve Days Of Christmas 🎶🎄 

On the 1st day of Christmas
My true love gave to me:
A partridge in a pear tree.

On the 2nd day of Christmas
My true love gave to me:
Two turtle doves,
And
A partridge in a pear tree.

On the 3rd day of Christmas
My true love gave to me:
Three french hens,
Two turtle doves,
And
A partridge in a pear tree.

On the 4th day of Christmas
My true love gave to me:
Four calling birdsm,
Three french hens,
Two turtle doves,
And
A partridge in a pear tree.

On the 5th day of Christmas
My true love gave to me:
Five golden rings,
Four calling birdsm,
Three french hens,
Two turtle doves,
And
A partridge in a pear tree.

On the 6th day of Christmas
My true love gave to me:
Six geese a-laying,
Five golden rings,
Four calling birdsm,
Three french hens,
Two turtle doves,
And
A partridge in a pear tree.

On the 7th day of Christmas
My true love gave to me:
Seven swans a-swimming,
Six geese a-laying,
Five golden rings,
Four calling birdsm,
Three french hens,
Two turtle doves,
And
A partridge in a pear tree.

On the 8th day of Christmas
My true love gave to me:
Eight maids a-milking,
Seven swans a-swimming,
Six geese a-laying,
Five golden rings,
Four calling birdsm,
Three french hens,
Two turtle doves,
And
A partridge in a pear tree.

On the 9th day of Christmas
My true love gave to me:
Nine ladies dancing,
Eight maids a-milking,
Seven swans a-swimming,
Six geese a-laying,
Five golden rings,
Four calling birdsm,
Three french hens,
Two turtle doves,
And
A partridge in a pear tree.

On the 10th day of Christmas
My true love gave to me:
Ten lords a-leaping,
Nine ladies dancing,
Eight maids a-milking,
Seven swans a-swimming,
Six geese a-laying,
Five golden rings,
Four calling birdsm,
Three french hens,
Two turtle doves,
And
A partridge in a pear tree.

On the 11th day of Christmas
My true love gave to me:
'Leven pipers piping,
Ten lords a-leaping,
Nine ladies dancing,
Eight maids a-milking,
Seven swans a-swimming,
Six geese a-laying,
Five golden rings,
Four calling birdsm,
Three french hens,
Two turtle doves,
And
A partridge in a pear tree.

On the 12th day of Christmas
My true love gave to me:
Twelve drummers drumming,
'Leven pipers piping,
Ten lords a-leaping,
Nine ladies dancing,
Eight maids a-milking,
Seven swans a-swimming,
Six geese a-laying,
Five golden rings,
Four calling birdsm,
Three french hens,
Two turtle doves,
And
A partridge in a pear tree.
```

## The code

I implemented this as a command line executable. I used `NumberFormatter`
for the day ordinal (unfortunatelly, there is no spelled-out ordinal fomatter). I also
used `usleep()` to slow down the print feed. Didn't spend time trying to match
the song too accurately, but better than nothing 😀

The code is relatively easy. One outer for loop for each of the twelve days, and 
one reverse inner loop for repeating the lyrics down to the first day.

Here is the source code:

```swift
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

let lineSleep: UInt32 = 400000 // Make zero for instant print
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
```

The code can be run from the command line with `swift run`, and tested with `swift test`.

Happy Holidays! 🎉🎄🎊🎇🎆

Eneko
