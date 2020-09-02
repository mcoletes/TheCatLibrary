//
//  CatsDetailDataSource.swift
//  TheCatsLibrary
//
//  Created by Mauro Coletes on 02/09/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import UIKit

class CatsDetailDataSource: NSObject, UITableViewDataSource {
    
    // MARK: - Internal Properties

    var items: [CatsDetail.CatsDetailType]
    
    // MARK: - Init

    init(items: [CatsDetail.CatsDetailType] = []) {
        self.items = items
    }
    // MARK: - UITableViewDataSource, UITableViewDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data = items[indexPath.row]
        switch data {
        case .detail(let name, let description):
            let cell: TitleSubstitleCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            cell.setup(title: name, subtitle: description)
            return cell
        case .image(let url):
            //self.indexPath = indexPath
            let cell: CatsImageCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            if let url = url {
                cell.setup(url: url)
            } else {
                cell.setup()
            }
            return cell
        case .iconTextValue(let behaviour):
            let cell: HorizontalScrollCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            cell.setup(behaviour: behaviour)
            return cell
        }
    }
}
