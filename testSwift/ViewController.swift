//
//  ViewController.swift
//  testSwift
//
//  Created by NATON on 2017/6/2.
//  Copyright © 2017年 NATON. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    private enum SegueIdentifier {
        static let showUserDetails = "showUserDetails"
    }
    
    var usernames: [String] = ["Marin"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setupTableView()
    }
    
    func setupTableView() -> () {
        let tableView = UITableView(frame: view.frame, style: UITableViewStyle.plain)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    //MARK: UITableViewDelegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usernames.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if (cell == nil) {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = usernames[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        usernametoSend = usernames[indexPath.row]
        performSegue(withIdentifier: SegueIdentifier.showUserDetails, sender: nil)
    }
    
    private var usernametoSend: String?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case SegueIdentifier.showUserDetails?:
            guard let usernameToSend = usernametoSend else {
                assertionFailure("No username provided")
                return
            }
            
            let destination = segue.destination as! UserDetailViewController
            destination.username = usernameToSend
        default:
            break
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

