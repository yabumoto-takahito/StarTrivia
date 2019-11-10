//
//  FilmsVC.swift
//  StarTrivia
//
//  Created by 薮本崇仁 on 2019/10/23.
//  Copyright © 2019 薮本崇仁. All rights reserved.
//

import UIKit

class FilmsVC: UIViewController, PersonProtocol {
    
    var person: Person!

    override func viewDidLoad() {
        super.viewDidLoad()
        print(person.name)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
