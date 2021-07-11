//
//  ViewController.swift
//  TimerForSfera
//
//  Created by Жеребцов Данил on 08.07.2021.
//

import UIKit

class TimerViewController: UIViewController  {
    
    var timers: [TimerModel] = []
    var timer: Timer?
    
    let tableView = UITableView()
    let titleLabel: UILabel = {
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        label.text = "Добавление таймеров"
        label.textAlignment = .center
        label.backgroundColor = .systemGray6
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    let titleTextField: UITextField = {
        
        let textfield = UITextField()
        textfield.placeholder = "Название таймера"
        textfield.keyboardType = .default
        textfield.borderStyle = .roundedRect
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
        
    }()
    
    let secondsTextField: UITextField = {
        
        let textfield = UITextField()
        textfield.placeholder = "Время в секундах"
        textfield.keyboardType = .numberPad
        textfield.borderStyle = .roundedRect
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
        
    }()
    
    
    let addButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = .systemGray6
        button.setTitle("Добавить", for: .normal)
        button.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.systemBlue, for: .normal)
        button.layer.cornerRadius = 15
        return button
    }()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(titleLabel)
        view.addSubview(titleTextField)
        view.addSubview(secondsTextField)
        view.addSubview(addButton)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = .systemGray6
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cellID")
        view.addSubview(tableView)
        tableView.delaysContentTouches = false
        
        setConstraints()
    }


    func setConstraints() {
        
        let guide = view.safeAreaLayoutGuide
        
        titleLabel.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        titleTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        titleTextField.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
        titleTextField.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -150).isActive = true
        
        secondsTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 20).isActive = true
        secondsTextField.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
        secondsTextField.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -150).isActive = true
        
        addButton.topAnchor.constraint(equalTo: secondsTextField.bottomAnchor, constant: 30).isActive = true
        addButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
        addButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        tableView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 30).isActive = true
        tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true

    }
    
    @objc func addButtonAction() {
        guard let timerTitle = titleTextField.text, let timerSeconds = Int(secondsTextField.text!) else { return }
        
        if timers.count == 0 {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
        
        timers.append(TimerModel(title: timerTitle, seconds: timerSeconds))
        timers.sort(by: {$0.seconds > $1.seconds } )
        titleTextField.text = nil
        secondsTextField.text = nil
        tableView.reloadData()
        
    }
    
    

    
    @objc func updateTimer() {
        
        if timers.count != 0 {
            
            for i in 0...timers.count-1 {
                
                if timers[i].seconds <= 0 {
                    timers.remove(at: i)
                    tableView.reloadData()
                    break
                    
                } else if timers[i].isActive {
                    timers[i].seconds-=1
                    tableView.reloadData()
                }
            }
            
        } else {
            timer?.invalidate()
        }
    }
    
}

