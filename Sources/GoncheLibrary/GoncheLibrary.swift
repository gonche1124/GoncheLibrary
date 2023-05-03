import SwiftUI

public struct GoncheLibrary {
    public private(set) var text = "Hello, World!"

    public init() {
    }
}

///
/// Format a list  with a given number of elements and the rest is get labeled as " & more"
public struct WrappedList<C>:FormatStyle where C: Collection
{

    public typealias FormatInput =  C
    public typealias FormatOutput = String

    //Standard: (and), short(&),, narrow(none)

    let maxItems:Int

    public func format(_ value: C) -> String {
        var outString = ""
        let totItems = value.count
        for (index, item) in value.enumerated(){
            if index >= maxItems {
                outString += " and \(totItems - index) more"
                break
            }
            outString += ",\(item)"
        }
        return outString
    }
    
    /// Public initializer so the static functions work...
    public init(maxItems:Int = Int.max){
        self.maxItems = maxItems
    }
}

extension FormatStyle where Self == WrappedList<[String]>{
    public static func listWrapped(_ maxItems:Int = Int.max)-> WrappedList<[String]>{
        return WrappedList(maxItems: maxItems)
    }
}
