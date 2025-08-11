//
//  OPBTableViewController.swift
//  MSShimmer_Example
//
//  Created by zz on 30.7.25.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import UIKit
import MSShimmer

class OPBTableViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.tableView.reloadData()
        }
    }

    lazy var tableView: UITableView = {
        let it = UITableView(frame: .zero, style: .plain)
        it.delegate = self
        it.dataSource = self
        it.register(OPBTableContentCell.self, forCellReuseIdentifier: "OPBTableContentCell")
        it.register(OPBTableShimmerCell.self, forCellReuseIdentifier: "OPBTableShimmerCell")
        return it
    }()
}

extension OPBTableViewController:MSShimmerTableViewDelegate {
    func numberOfSkeletonRows(in tableView: UITableView) -> Int {
        return 5
    }
    
    func skeletonCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "OPBTableShimmerCell") as! OPBTableShimmerCell
        return cell
    }
    
    func numberOfRealRows(in tableView: UITableView) -> Int {
        return 10
    }
    
    func realCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OPBTableContentCell") as! OPBTableContentCell
        return cell
    }
}

extension OPBTableViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "OPBTableShimmerCell") as! OPBTableShimmerCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let shimmerCell = cell as? OPBTableShimmerCell {
            shimmerCell.ms_start(force: true)
        }
    }
}
