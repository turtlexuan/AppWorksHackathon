//
//  MyActivityViewCOntroller.swift
//  PlanB
//
//  Created by 王迺瑜 on 2017/6/10.
//  Copyright © 2017年 AppWorksHackathon. All rights reserved.
//

import UIKit

class MyActivityTabelViewCell: UITableViewCell {
    
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var thLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var topVIew: UIView!
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var bigView: UIView!
    
}

class MyActivityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addEventButton: UIButton!
    
    let eventManager = EventManager.shared
    var activities: [[String : Any]] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "MyActivityTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.title = Constants.appName
        
        //test
        let activity: [String : Any] = ["activity_id": 1, "title": "一日遊", "type":"爬山", "description": "yaaaaa", "actDate": "20170611", "actPlace": "基隆路一段"]
        self.activities.append(activity)
        
//        self.eventManager.getMyActivity(success: { value in
//            
//            self.activities = value
//            self.tableView.reloadData()
//            
//        }, failed: {
//        
//            //Annoying pop up card//
//        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.activities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: MyActivityTabelViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyActivityTabelViewCell
        
        cell.topVIew.layer.cornerRadius = cell.topVIew.bounds.width / 2
        cell.timeView.layer.cornerRadius = 8
        cell.bigView.layer.cornerRadius = 10
        
        cell.tagLabel.text = self.activities[indexPath.row]["type"] as? String ?? "----"
        cell.locationLabel.text = self.activities[indexPath.row]["actPlace"] as? String ?? "----"
        cell.descriptionLabel.text = self.activities[indexPath.row]["description"] as? String ?? "----"
        //still need time and date//
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        let detailsVC = UIViewController(nibName: "ActivityDetailsViewController", bundle: nil) as! ActivityDetailsViewController
        
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    @IBAction func addEvent(_ sender: UIButton) {
    
    
    }
}
