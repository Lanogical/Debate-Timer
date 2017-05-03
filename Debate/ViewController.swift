//
//  ViewController.swift
//  Debate
//
//  Created by Ben Koska on 5/1/17.
//  Copyright © 2017 Lanogical. All rights reserved.
//

import UIKit
import Material

class ViewController: UIViewController {

    @IBOutlet var timerView: UIView!
    
    @IBOutlet weak var blur: UIVisualEffectView!
    @IBOutlet weak var closeButton: IconButton!
    
    @IBOutlet weak var timeLabel: UILabel!
    var standBlur: UIVisualEffect = UIVisualEffect()
    @IBOutlet weak var headerBar: UIView!
    @IBOutlet weak var button1: FlatButton!
    @IBOutlet weak var button2: FlatButton!
    @IBOutlet weak var button3: FlatButton!
    @IBOutlet weak var button4: FlatButton!
    
    var time = 240
    
    var timer = Timer()
    
    func close() {
        time = 240
        timerView.removeFromSuperview()
    }
    
    func settime(_ time: Int){
        self.time = time
    }
    
    func startTimer() {
        self.timeLabel.text = self.secondsToHoursMinutesSeconds(seconds: self.time)
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { (Timer) in
            self.time -= 1
            self.timeLabel.text = self.secondsToHoursMinutesSeconds(seconds: self.time)
        })
    }
    
    func updateTimer() {
        time -= 1;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = Color.grey.lighten3
        
        closeButton.image = Icon.close!
        
        closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        
        blur.removeFromSuperview()
        
        headerBar.backgroundColor = Color.indigo.base
        
        blur.effect = UIVisualEffect()
        
        setupUI()
    }
    
    func setupUI() {
        timerView.backgroundColor = Color.white.withAlphaComponent(0.85)
        setupFonts()
    }
    
    func buttonClicked1() {
        time = 240
        timerView.frame = self.view.frame
        startTimer()
        self.view.addSubview(timerView)
    }
    
    func buttonClicked2() {
        time = 180
        timerView.frame = self.view.frame
        startTimer()
        self.view.addSubview(timerView)
    }
    
    func buttonClicked3() {
        time = 120
        timerView.frame = self.view.frame
        startTimer()
        self.view.addSubview(timerView)
    }
    
    func buttonClicked4() {
        time = 120
        timerView.frame = self.view.frame
        startTimer()
        self.view.addSubview(timerView)
    }
    
    func secondsToHoursMinutesSeconds (seconds : Int) -> (String) {
        return ("\((seconds % 3600) / 60):\((seconds % 3600) % 60)")
    }
    
    func setupFonts() {
        button1.titleLabel?.font = RobotoFont.bold(with: 27.0)
        button2.titleLabel?.font = RobotoFont.bold(with: 27.0)
        button3.titleLabel?.font = RobotoFont.bold(with: 27.0)
        button4.titleLabel?.font = RobotoFont.bold(with: 27.0)
        
        button1.addTarget(self, action: #selector(buttonClicked1), for: .touchUpInside)
        button2.addTarget(self, action: #selector(buttonClicked2), for: .touchUpInside)
        button3.addTarget(self, action: #selector(buttonClicked3), for: .touchUpInside)
        button4.addTarget(self, action: #selector(buttonClicked4), for: .touchUpInside)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

