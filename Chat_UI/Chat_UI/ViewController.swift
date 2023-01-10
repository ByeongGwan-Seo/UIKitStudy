//
//  ViewController.swift
//  Chat_UI
//
//  Created by seobyeonggwan on 2023/01/09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var chatTableView: UITableView! {
        didSet {
            chatTableView.delegate = self
            chatTableView.dataSource = self
        }
    }
    
    var chatDatas = [String]()
    
    @IBOutlet weak var userInputView: UITextView!
    @IBOutlet weak var inputViewBottom: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 사용하려는 셀을 등록해야 사용할 수 있음
        chatTableView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "myCell")
        chatTableView.register(UINib(nibName: "YourCell", bundle: nil), forCellReuseIdentifier: "yourCell")
        
        // 키보드 관련 옵저버
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        let notiInfo = notification.userInfo ?? [:]
        let keyboardFrame = notiInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
        guard let height = keyboardFrame?.size.height else { return }
        let actualHeight = height - self.view.safeAreaInsets.bottom
        
        guard let animationDuration = notiInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else { return }
        
        UIView.animate(withDuration: animationDuration) {
            self.inputViewBottom.constant = actualHeight
            self.view.layoutIfNeeded()
        }
    }

    @objc func keyboardWillHide(notification: Notification) {
        let notiInfo = notification.userInfo ?? [:]
        guard let animationDuration = notiInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else { return }
        
        UIView.animate(withDuration: animationDuration) {
            self.inputViewBottom.constant = 0
            self.view.layoutIfNeeded()
        }
    }

    @IBAction func sendString(_ sender: UIButton) {
        
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row % 2 == 0 {
            guard let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as? MyCell else { return UITableViewCell() }
            
            return myCell
            
        } else {
            guard let yourCell = tableView.dequeueReusableCell(withIdentifier: "yourCell", for: indexPath) as? YourCell else { return UITableViewCell()}
            
            return yourCell
        }
    }
}
