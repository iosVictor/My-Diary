//
//  TaskTagTableViewController.swift
//  My Diary
//
//  Created by Victor Kimpel on 28.08.22.
//

import UIKit

class TaskTagTableViewController: UITableViewController {
    
    private let idTaskTagCell = "idTaskTagCell"
    private let idTaskDiaryHeader = "idTaskDiaryHeader"
    
    let headerNameArray = ["RED", "ORANGE", "YELLOW", "GREEN", "BLUE", "PURPLE", "GREY"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Task Tag"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = #colorLiteral(red: 1, green: 0.972737968, blue: 0.7814538479, alpha: 1)
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.register(TagsTableViewCell.self, forCellReuseIdentifier: idTaskTagCell)
        tableView.register(HeaderOptionsTableViewCell.self, forHeaderFooterViewReuseIdentifier: idTaskDiaryHeader)
    }
    
    private func setColor(color: String) {
        let taskOptions = self.navigationController?.viewControllers[1] as? TaskOptionsTableViewController
        taskOptions?.hexColorCell = color
        taskOptions?.tableView.reloadRows(at: [[3,0]], with: .none)
        self.navigationController?.popViewController(animated: true)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        7
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idTaskTagCell, for: indexPath) as! TagsTableViewCell
        cell.cellConfigure(indexPath: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idTaskDiaryHeader) as! HeaderOptionsTableViewCell
        header.headerConfigure(nameArray: headerNameArray, section: section)
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        24
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0: setColor(color: "941100")
        case 1: setColor(color: "EF5931")
        case 2: setColor(color: "F5B433")
        case 3: setColor(color: "32571A")
        case 4: setColor(color: "005493")
        case 5: setColor(color: "942193")
        case 6: setColor(color: "797979")
        default:
            setColor(color: "FFFFFF")
        }
    }
}

