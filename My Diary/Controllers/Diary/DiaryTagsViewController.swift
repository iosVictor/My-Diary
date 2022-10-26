//
//  DiaryTagsViewController: .swift
//  My Diary
//
//  Created by Victor Kimpel on 28.08.22.
//

import UIKit

protocol DiaryTagsActionPerformer: AnyObject {
    func setColor(color: String)
}

class DiaryTagsViewController: UITableViewController {
    
    private let idOptionsTagCell = "idOptionsTagCell"
    private let idOptionsDiaryHeader = "idOptionsDiaryHeader"
    
    let headerNameArray = ["RED", "ORANGE", "YELLOW", "GREEN", "BLUE", "PURPLE", "GREY"]
    
    var actionPerformer: DiaryTagsActionPerformer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Event Tags"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundView = UIImageView(image: #imageLiteral(resourceName: "fon"))
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.register(TagsTableViewCell.self, forCellReuseIdentifier: idOptionsTagCell)
        tableView.register(HeaderOptionsTableViewCell.self, forHeaderFooterViewReuseIdentifier: idOptionsDiaryHeader)
    }
    
    private func setColor(color: String) {
        actionPerformer?.setColor(color: color)
        self.navigationController?.popViewController(animated: true)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsTagCell, for: indexPath) as! TagsTableViewCell
        cell.cellConfigure(indexPath: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idOptionsDiaryHeader) as! HeaderOptionsTableViewCell
        header.headerConfigure(nameArray: headerNameArray, section: section)
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 16
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("TapCell")
        switch indexPath.section {
        case 0: setColor(color: "FF5B50")
        case 1: setColor(color: "FAA40F")
        case 2: setColor(color: "FFE014")
        case 3: setColor(color: "2BEF4A")
        case 4: setColor(color: "1C97FF")
        case 5: setColor(color: "D771FF")
        case 6: setColor(color: "92939D")
        default:
            setColor(color: "FFFFFF")
        }
    }
}

