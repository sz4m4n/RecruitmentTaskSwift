import Foundation
import Glibc

protocol CheckListProtocol {

    var isChecked: Bool { get }
}

class CheckListElement: CustomStringConvertible, CheckListProtocol {

    var textField: String = ""
    var dayOfTheWeek: String = ""
    var isChecked: Bool = false
    weak var delegate: CommunicationProtocol?

    init() {}

    init(dayOfTheWeek: String, textField: String, isChecked: Bool) {
        self.dayOfTheWeek = dayOfTheWeek
        self.textField = textField
        self.isChecked = isChecked
    }

    func changeFlag(isChecked: Bool, array: Array<CheckListElement>) {
	
        self.isChecked = isChecked
        delegate?.displayArray(array: array)
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

protocol CommunicationProtocol: class {

    func displayArray(array: Array<CheckListElement>)
}

class CheckList: CommunicationProtocol {

    var ob1 = CheckListElement(dayOfTheWeek: "Środa", textField: "Wynieść śmieci", isChecked: true)
    var ob2 = CheckListElement(dayOfTheWeek: "Czwartek", textField: "Wynieść śmieci", isChecked: false)
    var ob3 = CheckListElement(dayOfTheWeek: "Piątek", textField: "Posprzątać w domu", isChecked: false)

    func displayArray(array: Array<CheckListElement>) {

        for element in array {
            print(element)
        }
    }

}

var list = [CheckListElement]()
list.append(CheckListElement(dayOfTheWeek: "Wtorek", textField: "Wywiesić pranie", isChecked: true))
list.append(CheckListElement(dayOfTheWeek: "Środa", textField: "Wynieść śmieci", isChecked: false))
list.append(CheckListElement(dayOfTheWeek: "Czwartek", textField: "Zrobić zakupy", isChecked: false))

var objectCheckListElement = CheckListElement()
var objectCheckList = CheckList()
objectCheckListElement.delegate = objectCheckList
objectCheckListElement.changeFlag(isChecked: false, array: list)