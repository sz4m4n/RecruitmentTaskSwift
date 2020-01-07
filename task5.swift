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

    func displayArray(array: Array<CheckListElement>) {

        for element in array {
            print(element)
        }
    }

    func displayArrayEveryThirdElement(array: Array<CheckListElement>) {

        var arrayTemp = Array<CheckListElement>()
        var i: Int = 1

        for element in array {
            if (i % 3 == 0) {
                arrayTemp.append(element)
            }
            i = i + 1
        }

        for element in arrayTemp {
            print(element)
        }
        print("------------------------------------")
    }

}

var list = Array<CheckListElement>()
list.append(CheckListElement(dayOfTheWeek: "Poniedziałek", textField: "Zrobić listę", isChecked: true))
list.append(CheckListElement(dayOfTheWeek: "Wtorek", textField: "Wstawić pranie", isChecked: true))
list.append(CheckListElement(dayOfTheWeek: "Środa", textField: "Wynieść śmieci", isChecked: true))
list.append(CheckListElement(dayOfTheWeek: "Czwartek", textField: "Zrobić zakupy", isChecked: false))
list.append(CheckListElement(dayOfTheWeek: "Piątek", textField: "Zatankować auto", isChecked: false))
list.append(CheckListElement(dayOfTheWeek: "Sobota", textField: "Przeczytać książkę", isChecked: false))

var objectCheckList = CheckList()
objectCheckList.displayArrayEveryThirdElement(array: list)

let object = CheckListElement(dayOfTheWeek: "Poniedziałek", textField: "Zatankować auto", isChecked: true)
object.changeFlag(isChecked: false, array: list)
object.descriptionWithoutParameters()
object.description(dayOfTheWeek: "Wtorek", textField: "Zrobić Pranie", isChecked: true)
print("---------------------------------------------------")

let objectWithProtocol = CheckListElement(dayOfTheWeek: "Środa", textField: "Zrobić Pranie", isChecked: false)
print(objectWithProtocol)