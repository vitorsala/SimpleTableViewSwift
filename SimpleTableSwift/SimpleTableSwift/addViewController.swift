//
//  addViewController.swift
//  SimpleTableSwift
//
//  Created by Vitor Kawai Sala on 10/04/15.
//  Copyright (c) 2015 Vitor Kawai Sala. All rights reserved.
//

import UIKit

class addViewController: UIViewController {
    let dados : DataSource = DataSource.sharedInstance
    @IBOutlet weak var txtField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnSave(sender: AnyObject) {
        dados.addObject(txtField.text)
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
