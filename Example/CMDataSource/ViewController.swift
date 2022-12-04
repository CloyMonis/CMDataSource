//
//  ViewController.swift
//  CMDataSource
//
//  Created by CloyMonisVMax on 12/04/2022.
//  Copyright (c) 2022 CloyMonisVMax. All rights reserved.
//

import UIKit
import CMDataSource

class ViewController: UIViewController {

    let dataSource = CMDataSource(publicKey: "c40d792a72af498d04533a2c37b63f96", privateKey: "f416461a42f5b768c06ceb40ce2e200c35cde56b")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        dataSource.fetch(from: 0) { result in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

