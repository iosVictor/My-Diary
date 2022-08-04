//
//  DiaryViewController.swift
//  My Diary
//
//  Created by Victor Kimpel on 29.07.22.
//

import UIKit

class DiaryViewController: UIViewController {
    
    let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.preferredDatePickerStyle = .compact
        picker.backgroundColor = #colorLiteral(red: 0.5791940689, green: 0.1280144453, blue: 0.5726861358, alpha: 0.5)
        return picker
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Дневник"
        
        setupCalendar()
    }
    
    func setupCalendar() {
        view.addSubview(datePicker)
        NSLayoutConstraint.activate([
            datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
//            datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            datePicker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 0),
//            datePicker.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)
        ])
        
//        datePicker.addTarget(self, action: #selector(didTap), for: .touchUpInside)
    }
    
    @objc private func didTap() {
        let dateFormatter = DateFormatter()
        let date = datePicker.date
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        let string = dateFormatter.string(from: date)
        print(string)
    }
    
}
