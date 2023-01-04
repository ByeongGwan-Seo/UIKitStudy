//
//  ViewController.swift
//  ExpandCell
//
//  Created by seobyeonggwan on 2023/01/03.
//

import UIKit

class ViewController: UIViewController {

    // 필요한 텍스트가 포함되어야함.
    // 구조를 잘 잡는 것이 중요하며, expand 상태가 필요함.
    
    // Model
    struct ExpandDataModel {
        var description: String
        var isExpand: Bool
    }
    
    var dataModels = [ExpandDataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textArray = ["short Text",
                         "long long long long long long long long long long long long long long text",
                         "short Text",
                        "long long long long long long long long long long long long long long text",
                         "short Text",
                        "long long long long long long long long long long long long long long text",
                         "short Text",
                        "long long long long long long long long long long long long long long text",
                         "short Text",
                        "long long long long long long long long long long long long long long text",
                         "short Text",
                        "long long long long long long long long long long long long long long text",
        ]
        
        for (_, value) in textArray.enumerated() {
            dataModels.append(ExpandDataModel.init(description: value, isExpand: false))
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExpandCell", for: indexPath) as? ExpandCell else { return UITableViewCell() }
        
        cell.descriptionLabel.text = dataModels[indexPath.row].description
        
        if dataModels[indexPath.row].isExpand == true {
            cell.descriptionLabel.numberOfLines = 0
        } else {
            cell.descriptionLabel.numberOfLines = 1
        }
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataModels[indexPath.row].isExpand = !dataModels[indexPath.row].isExpand
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

extension ViewController: UITableViewDelegate {
    
}
