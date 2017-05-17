//
//  SecondViewController.swift
//  Lumosity Color Match
//
//  Created by Apple on 31.12.16.
//  Copyright © 2016 KBTU. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var correct = 0
    var wrong = 0
    
    @IBOutlet var correctLabel: UILabel!
    @IBOutlet var wrongLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        correctLabel.text = String(correct)
        wrongLabel.text = String(wrong)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
