//
//  ViewController.swift
//  Nested Table View
//
//  Created by tunlukhant on 9/15/19.
//  Copyright © 2019 tunlukhant. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var tableviewNested: UITableView!
    
    var parents: [ParentVO] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let baseUrlString = "https://a847c7d4-655d-497f-9f10-b3ea1a4e51b5.mock.pstmn.io/parents"
//        guard let url = URL(string: baseUrlString) else {return}
//
//        Alamofire.request(url).responseData { (response) in
//
//            guard let data = response.result.value else {return}
//
//            do {
//                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
//                self.parentList = try
//                    decoder.decode([ParentVO].self, from: data)
//
//                self.tableviewNested.reloadData()
//
//            } catch let jsonErr {
//                print(jsonErr.localizedDescription)
//            }
//        }
        
        tableviewNested.separatorStyle = .none
        tableviewNested.delegate = self
        tableviewNested.dataSource = self
        
        tableviewNested.register(UINib(nibName: ParentListItemTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ParentListItemTableViewCell.identifier)
        getHouseList()
    }

    private func getHouseList() {
        ParentModel.shared().modelGetParentList(success: {
            self.parents = ParentModel.shared().parent
            self.tableviewNested.reloadData()
        }) { (err) in
            print(err)
        }
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let childItemCount = self.parentList[indexPath.row].childs?.count ?? 0
        let childItemCount = parents[indexPath.row].childs?.count ?? 0
        return CGFloat(55 + (108 * childItemCount))
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ParentModel.shared().parent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ParentListItemTableViewCell.identifier, for: indexPath) as! ParentListItemTableViewCell
//        cell.parent = self.parentList[indexPath.row]
        cell.parent = parents[indexPath.row]
        return cell
    }
    
    
}

