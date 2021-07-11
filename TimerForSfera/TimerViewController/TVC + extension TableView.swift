//
//  TVC + extension TableView.swift
//  TimerForSfera
//
//  Created by Жеребцов Данил on 11.07.2021.
//

import UIKit

extension TimerViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! CustomCell
        cell.textLabel?.text = timers[indexPath.row].title
        
        
        if timers[indexPath.row].isActive {
            cell.pauseImage.image = UIImage(systemName: "pause.fill")
        } else {
            cell.pauseImage.image = UIImage(systemName: "play.fill")
        }
        
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional
        let formattedTimer = formatter.string(from: TimeInterval(String(timers[indexPath.row].seconds))!)
        
        cell.timerLabel.text = formattedTimer
        
        return cell
    }
    
  
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
        let textLabel = UILabel(frame: CGRect(x: 5, y: 5, width: header.frame.width-100, height:header.frame.height-10))
        
        textLabel.text = "Таймеры"
        header.backgroundColor = .systemGray6
        textLabel.textColor = .darkGray
        header.addSubview(textLabel)
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.centerYAnchor.constraint(equalTo: header.centerYAnchor).isActive = true
        textLabel.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 20).isActive = true
        
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        timers[indexPath.row].isActive.toggle()
        tableView.reloadData()
    }
    
    
    
}
