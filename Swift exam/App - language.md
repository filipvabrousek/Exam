# Language

```swift
 func getLanguage(){
        let tagger = NSLinguisticTagger(tagSchemes: [.language], options: 0)
        tagger.string = "I love Swift!"
        guard let textLang = tagger.dominantLanguage else { return }
        print(textLang)
    }
    
        
    func nameType(){
        let tagger = NSLinguisticTagger(tagSchemes: [.nameType], options: 0)
        tagger.string = "Filip went to Apple store"
        
        let omitOptions: NSLinguisticTagger.Options = [.omitPunctuation, .omitWhitespace]
        let tags: [NSLinguisticTag] = [.personalName, .organizationName]
        
        let range = NSRange(location: 0, length: (tagger.string?.characters.count)!)
        
        tagger.enumerateTags(in: range, unit: .word, scheme: .nameType, options: omitOptions) { (tag, range, stop) in
            
            guard let tag = tag, tags.contains(tag) else { return }
             
            let nameType = (tagger.string as! NSString).substring(with: range)
            print("\(nameType) - \(tag.rawValue)")
        }
    }
    

```


