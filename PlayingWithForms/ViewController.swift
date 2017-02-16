//
//  ViewController.swift
//  PlayingWithForms
//
//  Created by Rafael Ribeiro Correia on 16/02/17.
//  Copyright © 2017 Rafael Ribeiro Correia. All rights reserved.
//

import UIKit
import Eureka

class ViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        form +++ Section()
            <<< TextRow(){ row in
                row.title = "Job"
                row.tag = "job"
            }
            <<< TextRow(){ row in
                row.title = "Name"
                row.tag = "name"
            }
            <<< DateRow(){ row in
                row.title = "Birthdate"
                row.value = Date()
                row.tag = "birthday"
                }
            <<< ButtonRow() { row in
                row.title = "Send"
                row.tag = "button"
                row.onCellSelection({ (_:ButtonCellOf<String>, _: (ButtonRow)) in
                    // Get the value of a single row
                    let row: TextRow? = self.form.rowBy(tag: "name")
                    if let value = row?.value {
                        print(value);
                    }
                    
                    // Get the value of all rows which have a Tag assigned
                    // The dictionary contains the 'rowTag':value pairs.
                    let valuesDictionary = self.form.values()
                    print(valuesDictionary);
                    if let birthday = valuesDictionary["birthday"] {
                        print("aniversario: \(birthday)")
                    }
                })
            }
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

