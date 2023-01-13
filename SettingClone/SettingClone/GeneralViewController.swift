//
//  GeneralViewController.swift
//  SettingClone
//
//  Created by seobyeonggwan on 2023/01/12.
//

import UIKit

class GeneralViewController: UIViewController {

    @IBOutlet weak var generalTableView: UITableView!
    
    var generalModel = [[GeneralModel]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "General"
        self.view.backgroundColor = .systemGray6
        generalTableView.backgroundColor = .systemGray6
        generalTableView.register(UINib(nibName: "GeneralCell", bundle: nil), forCellReuseIdentifier: "GeneralCell")
        
        generalTableView.delegate = self
        generalTableView.dataSource = self
       

        makeGeneralData()
    }
    
    func makeGeneralData() {
        generalModel.append([GeneralModel(generalTitle: "About")])
        
        generalModel.append(
        [GeneralModel(generalTitle: "Keyboard"),
        GeneralModel(generalTitle: "Game Controller"),
        GeneralModel(generalTitle: "Fonts"),
        GeneralModel(generalTitle: "Language & Region"),
        GeneralModel(generalTitle: "Dictionary")]
        )
        
        generalModel.append([GeneralModel(generalTitle: "Reset")])
    }
}

extension GeneralViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        
        if section == 0 {
            return 0.01
        }
        return 30
    }
}

extension GeneralViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return generalModel[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return generalModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GeneralCell", for: indexPath) as? GeneralCell else { return UITableViewCell() }
        
        cell.generalTitle.text = generalModel[indexPath.section][indexPath.row].generalTitle
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
