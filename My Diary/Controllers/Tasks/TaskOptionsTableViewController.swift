//
//  TaskOptionsTableViewController.swift
//  My Diary
//
//  Created by Victor Kimpel on 28.08.22.
//

import UIKit

class TaskOptionsTableViewController: UITableViewController {
    
    private let idOptionsTaskCell = "idOptionsTaskCell"
    private let idOptionsTasksHeader = "idOptionsTasksHeader"
    
    let headerNameArray = ["DATE", "EVENT", "TASK", "TAGS"]
    let cellNameArray = ["Date", "Event", "Task", ""]
    
    var hexColorCell = "1C97FF"
    
    private var taskModel = TaskModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add Task"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundView = UIImageView(image: #imageLiteral(resourceName: "fon"))
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.register(OptionsTableViewCell.self, forCellReuseIdentifier: idOptionsTaskCell)
        tableView.register(HeaderOptionsTableViewCell.self, forHeaderFooterViewReuseIdentifier: idOptionsTasksHeader)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save,
                                                            target: self,
                                                            action: #selector(saveButtonTapped))
    }
    
    @objc private func saveButtonTapped() {
        
        if taskModel.taskDate == nil || taskModel.taskName == "Here can be your advertising" {
            alertOk(title: "Error", message: "Fill in required fields: DATE, EVENT")
        } else {
            taskModel.taskTag = hexColorCell
            RealmManager.shared.saveTaskModel(model: taskModel)
            taskModel = TaskModel()
            alertOk(title: "Saved successfully", message: nil)
            hexColorCell = "1C97FF"
            tableView.reloadData()
        }
    }
    
    private func pushControllers(vc: UIViewController) {
        let viewController = vc
        navigationController?.navigationBar.topItem?.title = "Options"
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsTaskCell, for: indexPath) as! OptionsTableViewCell
        cell.cellTasksConfigure(nameArray: cellNameArray, indexPath: indexPath, hexColor: hexColorCell)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idOptionsTasksHeader) as! HeaderOptionsTableViewCell
        header.headerConfigure(nameArray: headerNameArray, section: section)
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        24
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! OptionsTableViewCell
        
        switch indexPath.section {
        case 0: alertDate(label: cell.nameCellLabel) { numberWeekday, date in
            self.taskModel.taskDate = date
        }
        case 1: alertForCellName(label: cell.nameCellLabel, name: "Event Name", placeholder: "Enter event name") { text in
            self.taskModel.taskName = text
        }
        case 2: alertForCellName(label: cell.nameCellLabel, name: "Task", placeholder: "Enter a task") { text in
            self.taskModel.taskDescription = text
        }
        case 3:  let vc = DiaryTagsViewController()
            vc.actionPerformer = self
            pushControllers(vc: vc)
        default:
            print("Tap OptionsTableView")
        }
    }
}

extension TaskOptionsTableViewController: DiaryTagsActionPerformer {
    func setColor(color: String) {
        hexColorCell = color
        tableView.reloadRows(at: [[3,0]], with: .automatic)
    }
}

