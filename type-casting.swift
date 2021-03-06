class Genre {
    var name: String
    init(name: String) { self.name = name }
}

class Classical : Genre {

}

class Pop : Genre {

}

var collection = [
    Pop(name: "Hard Day's Night"),
    Classical(name: "Canon in D"),
]

// The type of `collection` is inferred to be `Genre`

// Use `is` to check instance of.

for song in collection {
    if song is Classical {
        print("\(song.name) is classical!")
    } else if song is Pop {
        print("\(song.name) is poppy!")
    }
}

/*
Hard Day's Night is poppy!
Canon in D is classical!
*/


// # Downcasting

// `as?` returns an optional (if you aren't sure the cast will succeed)
// `as` throws a runtime error if the cast doesn't succeed

for song in collection {
    if let popSong = song as? Pop {
        print("pop song")
    } else if let classicalSong = song as? Classical {
        print("classical song")
    }
}

/*
pop song
classical song
*/

// # AnyObject

// Tons of Cocoa APIs (dicts, arrays, etc.) return `AnyObject`, a generic
// object wrapper. You have to use `as` to cast an `AnyObject` back to the
// type you expect.

// `AnyObject` doesn't allow primitives--only class-based objects.

var randomCollection: [AnyObject] = [
    Pop(name: "Bishop Allen"),
    Classical(name: "Bach"),
]

for item in randomCollection {
    let songGenre = item as! Genre
    print("\(songGenre.self)")       // C11lldb_expr_03Pop (has 1 child) // C11lldb_expr_09Classical
    print("\(songGenre.name)")
}

// Every item can also be downcasted in the for-loop

for item in randomCollection as! [Genre] {
    print("\(item.name)")
}

/*
Bishop Allen
Bach
*/

// # Any

// `Any` allows primitives and class-based objects.

var groups = [Any]()
groups.append(1.0)
groups.append(1)
groups.append("string")
groups.append(Pop(name: "Long Winters"))

for item in groups {
    switch item {
    case let anInt as Int:
        print("\(item) is an int")
    case let aDouble as Double:
        print("\(item) is a double")
    case let aString as String:
        print("\(item) is a string")
    case let aGenre as Genre:
        print("\(item) is a Genre")
    default:
        print("dunno")
    }
}

/*
1.0 is a double
1 is an int
string is a string
C11lldb_expr_13Pop (has 1 child) is a Genre
*/
