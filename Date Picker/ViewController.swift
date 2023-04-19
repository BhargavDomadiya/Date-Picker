//
//  ViewController.swift
//  Date Picker
//
//  Created by R87 on 14/04/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var bookingDateTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUP()
        configureDatePicker()
        // Do any additional setup after loading the view.
    }
    private func setUP() {
        bookingDateTextField.delegate = self
    }
    private func configureDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        datePicker.minimumDate = Calendar.current.date(byAdding: .day, value: 15, to: Date())
        datePicker.maximumDate = Date()
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        print(sender.date)
        bookingDateTextField.text = sender.date.convertToString(format: "dd MMM yyyy")
        Calendar.current.date(byAdding: .day, value: 15, to: sender.date)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField.tag == 0 {
            datePicker.isHidden = false
            return false
        }
        return true
    }
}

extension String {
    func convertToDate(format: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: self) ?? Date()
    }
}

extension Date {
    func convertToString(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
