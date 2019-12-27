//
//  ClaimOffer.swift
//  SNACC
//
//  Created by David Lin on 12/23/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import UIKit

class ClaimOffer: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    
    
}

extension ClaimOffer: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "claimCell", for: indexPath) as? ClaimCell else {
            fatalError("")
        }
        return cell
    }
}

extension ClaimOffer: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}
