import Foundation
import Glibc

class CheckListElement: CustomStringConvertible {

    var textField: String = ""
    var dayOfTheWeek: String = ""
    var isChecked: Bool = false
    
    init() {}

    init(dayOfTheWeek: String, textField: String, isChecked: Bool) {
        self.dayOfTheWeek = dayOfTheWeek
        self.textField = textField
        self.isChecked = isChecked
    }

    func description(dayOfTheWeek: String, textField: String, isChecked: Bool) {
    
        let result = dayOfTheWeek.range( of: "[a-zA-Z]", options: .regularExpression) != nil
        
        if result == true {
            if isChecked == false {
                print(dayOfTheWeek + " " + textField + " -> " + "Do Wykonania")
            } else {
                print(dayOfTheWeek + " " + textField + " -> " + "Gotowe")
            }
        } else {
            print("Incorrect name of the day")
        }
    }

    func descriptionWithoutParameters() {

        let result = dayOfTheWeek.range( of: "[a-zA-Z]", options: .regularExpression) != nil
        
        if result == true {
            if isChecked == false {
                print(dayOfTheWeek + " " + textField + " -> " + "Do Wykonania")
            } else {
                print(dayOfTheWeek + " " + textField + " -> " + "Gotowe")
            }
        } else {
            print("Incorrect name of the day")
        }
    }

    var description: String {

        var description = ""
        description += "\(self.dayOfTheWeek) "
        description += "\(self.textField)"
        description += " -> "
        
        if isChecked == false {
            description += "Do Wykonania"
        } else {
            description += "Gotowe"
        }
        return description
    }

}

let object = CheckListElement(dayOfTheWeek: "Sobota", textField: "Wyjść na spacer", isChecked: true)
object.descriptionWithoutParameters()
object.description(dayOfTheWeek: "Sobota", textField: "Zrobić zakupy", isChecked: true)

let objectWithProtocol = CheckListElement(dayOfTheWeek: "Niedziela", textField: "Wrócić do domu", isChecked: true)
print(objectWithProtocol)