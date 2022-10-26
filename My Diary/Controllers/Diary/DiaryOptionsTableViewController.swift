//
//  DiaryOptionsTableViewController.swift
//  My Diary
//
//  Created by Victor Kimpel on 28.08.22.
//

import UIKit

class DiaryOptionsTableViewController: UITableViewController {
    
    private let idOptionsDiaryCell = "idOptionsDiaryCell"
    private let idOptionsDiaryHeader = "idOptionsDiaryHeader"
    
    private let headerNameArray = ["DATE AND TIME", "EVENT", "PERSON", "TAGS", "PERIOD"]
    
    var cellNameArray = [["Date", "Time"],
                         ["Name", "Type", "Address"],
                         ["Person Name"],
                         [""],
                         ["Repeat every 7 days"]]
    
    var diaryModel = DiaryModel()
    
    var hexColorCell = "1C97FF"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add Event"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundView = UIImageView(image: #imageLiteral(resourceName: "fon"))
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.register(OptionsTableViewCell.self, forCellReuseIdentifier: idOptionsDiaryCell)
        tableView.register(HeaderOptionsTableViewCell.self, forHeaderFooterViewReuseIdentifier: idOptionsDiaryHeader)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
    }
    
    @objc private func saveButtonTapped() {
        
        if diaryModel.diaryDate == nil || diaryModel.diaryTime == nil || diaryModel.diaryName == "Here can be your advertising" {
            alertOk(title: "Error", message: "Fill in required fields: DATE, TIME, NAME")
        } else {
            diaryModel.diaryTag = hexColorCell
            RealmManager.shared.saveDiaryModel(model: diaryModel)
            diaryModel = DiaryModel()
            alertOk(title: "Saved successfully", message: nil)
            hexColorCell = "1C97FF"
            cellNameArray[2][0] = "Person Name"
            tableView.reloadData()
        }
    }
    
    private func pushControllers(vc: UIViewController) {
        let viewController = vc
        navigationController?.navigationBar.topItem?.title = "Options"
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 2
        case 1: return 3
        case 2: return 1
        case 3: return 1
        default:
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsDiaryCell, for: indexPath) as! OptionsTableViewCell
        cell.cellDiaryConfigure(nameArray: cellNameArray, indexPath: indexPath, hexColor: hexColorCell)
        cell.switchRepeatDelegate = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idOptionsDiaryHeader) as! HeaderOptionsTableViewCell
        header.headerConfigure(nameArray: headerNameArray, section: section)
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        24
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! OptionsTableViewCell
        switch indexPath {
        case [0,0]:
            alertDate(label: cell.nameCellLabel) { numberWeekday, date in
                self.diaryModel.diaryDate = date
                self.diaryModel.diaryWeekday = numberWeekday
        }
        case [0,1]:
            alertTime(label: cell.nameCellLabel) { time in
                self.diaryModel.diaryTime = time
        }
        case [1,0]:
            alertForCellName(label: cell.nameCellLabel, name: "Event Name", placeholder: "Enter event name") { text in
                self.diaryModel.diaryName = text
        }
        case [1,1]:
            alertForCellName(label: cell.nameCellLabel, name: "Event Type", placeholder: "Enter event type") { text in
                self.diaryModel.diaryType = text
        }
        case [1,2]:
            alertForCellName(label: cell.nameCellLabel, name: "Event Address", placeholder: "Enter event address") { text in
                self.diaryModel.diaryAddress = text
        }
        case [2,0]:
            pushControllers(vc: PersonsTableViewController())
        case [3,0]:
            let vc = DiaryTagsViewController()
            vc.actionPerformer = self
            pushControllers(vc: vc)
        default:
            print("Tap OptionsTableView")
        }
    }
}

extension DiaryOptionsTableViewController: DiaryTagsActionPerformer {
    func setColor(color: String) {
        hexColorCell = color
        tableView.reloadRows(at: [[3,0], [4,0]], with: .automatic)
    }
}

extension DiaryOptionsTableViewController: SwitchRepeatProtocol {
    func switchRepeat(value: Bool) {
        diaryModel.diaryRepeat = value
    }
}
