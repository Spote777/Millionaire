//
//  ResultVC.swift
//  Millionaire
//
//  Created by Павел Заруцков on 20.02.2021.
//

import UIKit

class ResultVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Game.shared.results.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath) as! ResultCell
        
        let record = Game.shared.results[indexPath.row]
        cell.dateLabel.text = record.started.description
        cell.scoreLabel.text = "score: \(record.score)"
        
        return cell
    }

}
