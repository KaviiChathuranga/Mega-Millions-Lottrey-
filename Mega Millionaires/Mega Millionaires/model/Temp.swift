import Foundation
import SwiftyJSON
class Temp {
    var text : String!
    var type : String!
    
    init(json : JSON){
        self.text = json["text"].stringValue
        self.type = json["type"].stringValue
     }
    
}
