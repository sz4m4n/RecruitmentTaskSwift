import Foundation
import Glibc

class CheckListElement: CustomStringConvertible {

    var textField: String = ""
    var isChecked: Bool = false
    
    init() {}

    init(textField: String, isChecked: Bool) {
        self.textField = textField
        self.isChecked = isChecked
    }

    func description(textField: String, isChecked: Bool) {

        if isChecked == false {
            print(textField + " -> " + "Do Wykonania")
        }
        else {
            print(textField + " -> " + "Gotowe")
        }
    }

    func descriptionWithoutParameters() {

        if isChecked == false {
            print(textField + " -> " + "Do Wykonania")
        }
        else {
            print(textField + " -> " + "Gotowe")
        }
    }

    var description: String {
      
        var description = ""
        description += "\(self.textField)"
        description += " -> "
        if isChecked == false {
            description += "Do Wykonania"

        }
        else {
            description += "Gotowe"
        }
        return description
    }
    
}

let object = CheckListElement(textField: "Poniedziałek Zrobić Pranie", isChecked: true)
object.descriptionWithoutParameters()
object.description(textField: "Wtorek Zrobić Pranie", isChecked: false)

let objectWithProtocol = CheckListElement(textField: "Środa Zrobić Pranie", isChecked: false)
print(objectWithProtocol)