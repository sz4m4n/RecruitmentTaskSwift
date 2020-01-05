import Foundation
import Glibc

protocol CheckListProtocol {

    var isChecked: Bool { get }
}

class CheckListElement: CustomStringConvertible, CheckListProtocol {

    var textField: String = ""
    var dayOfTheWeek: String = ""
    var isChecked: Bool = false

    init(dayOfTheWeek: String, textField: String, isChecked: Bool) {
        self.dayOfTheWeek = dayOfTheWeek
        self.textField = textField
        self.isChecked = isChecked
    }

    func changeFlag(flag: Bool) {
        isChecked = flag;
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

    func description(dayOfTheWeek: String, textField: String) {

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

let object = CheckListElement(dayOfTheWeek: "Sobota", textField: "Wyjść na spacer", isChecked: false)
object.changeFlag(flag: true)
object.descriptionWithoutParameters()
object.description(dayOfTheWeek: "Niedziela", textField: "Zrobić zakupy")