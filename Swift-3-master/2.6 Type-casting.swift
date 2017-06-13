/*--------Classes: MI (Media Item), M (Movie), S(Song), library
 ----------------------------------------------------------------*/
class MI {
    var name: String
    init(name: String) {
        self.name = name
    }
}


class M: MI {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class S: MI {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
    M(name: "Casablanca", director: "Michael Curtiz"),
    S(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    M(name: "Citizen Kane", director: "Orson Welles"),
    S(name: "The One And Only", artist: "Chesney Hawkes"),
    S(name: "Never Gonna Give You Up", artist: "Rick Astley")
]
// the type of "library" is inferred to be [MediaItem]



/*--------For/In
 ----------------------------------------------------------------*/
var movieCount = 0
var songCount = 0

for item in library {
    if item is M {
        movieCount += 1
    } else if item is S {
        songCount += 1
    }
}

print("Media library contains \(movieCount) movies and \(songCount) songs")
// Prints "Media library contains 2 movies and 3 songs"


for item in library {
    if let movie = item as? M {
        print("Movie: \(movie.name), dir. \(movie.director)")
    } else if let song = item as? S {
        print("Song: \(song.name), by \(song.artist)")
    }
}

// Movie: Casablanca, dir. Michael Curtiz
// Song: Blue Suede Shoes, by Elvis Presley
// Movie: Citizen Kane, dir. Orson Welles
// Song: The One And Only, by Chesney Hawkes
// Song: Never Gonna Give You Up, by Rick Astley







/*--------Appending to things object + For/In
 ----------------------------------------------------------------*/
var things = [Any]()

things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(M(name: "Ghostbusters", director: "Ivan Reitman"))
things.append({ (name: String) -> String in "Hello, \(name)" })





for thing in things {
    switch thing {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let movie as M:
        print("a movie called \(movie.name), dir. \(movie.director)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Michael"))
    default:
        print("something else")
    }
}

// zero as an Int
// zero as a Double
// an integer value of 42
// a positive double value of 3.14159
// a string value of "hello"
// an (x, y) point at 3.0, 5.0
// a movie called Ghostbusters, dir. Ivan Reitman
// Hello, Michael
