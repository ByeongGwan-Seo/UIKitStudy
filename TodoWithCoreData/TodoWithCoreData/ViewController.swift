//
//  ViewController.swift
//  TodoWithCoreData
//
//  Created by seobyeonggwan on 2023/01/18.
//

import UIKit
import CoreData

//let appDelegate = UIApplication.shared.delegate as? AppDelegate

class ViewController: UIViewController {

    @IBOutlet weak var todoTableView: UITableView!
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    var todoList = [Todo_list]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "To Do List"
        self.makeNavigationBar()
        
        todoTableView.delegate = self
        todoTableView.dataSource = self
        
        fetchData()
        todoTableView.reloadData()
    }
    
    func fetchData() {
        let fetchRequest: NSFetchRequest<Todo_list> = Todo_list.fetchRequest()
        let context = appDelegate?.persistentContainer.viewContext
        
        do {
            self.todoList = try context?.fetch(fetchRequest) ?? []
        } catch {
            print(error)
        }
    }
    

    func makeNavigationBar() {
        let item = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(addNewTodo))
        item.tintColor = .black
        navigationItem.rightBarButtonItem = item
        
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = UIColor(red: 30/255, green: 40/255, blue: 50/255, alpha: 0.3)
        
        self.navigationController?.navigationBar.standardAppearance = barAppearance
    }
    
    @objc func addNewTodo() {
        
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as? TodoCell else { return UITableViewCell()}
        
        cell.titleLabel.text = todoList[indexPath.row].title
        
        if let hasDate = todoList[indexPath.row].date {
            let formatter = DateFormatter()
            formatter.dateFormat = "yy. MM. dd hh:mm"
            let dateString = formatter.string(from: hasDate)
            
            cell.dateLabel.text = dateString
        } else {
            cell.dateLabel.text = ""
        }
        
        return cell
    }
    
    
}
