# TableViewCellConfigurator
🚀  The quickest way to rapid customization of UITableView with some cells.

## Advantages

- [x] Don't have to focus on tableView protocol.
- [x] Make logic clear.
- [x] Edit easy
 
## Requirements

- iOS 8.0+ 
- Swift3.0+

## Install
You can use `CocoaPods` to install `KSYCellConfigurator`

```
     pod 'KSYCellConfigurator', "~> 1.2"
```

## How to use 
* Import file

 `import KSYCellConfigurator`

* Create some cells
``` Swift
        let cell1 = KSYCellConfigurator<TableViewCell>(
            viewModel: TableViewModel(title: "say", image: UIImage(named: "DistanceIcon.png")) ,
            height: 44,
            selection: KSYCellSelectedAction(selectedAction: { (indexPath) in
                print("did Selected indexPath section: \(indexPath.section) row: \(indexPath.row)")
        }))
        
        let cell2 = KSYCellConfigurator<TableViewCell>(
            viewModel: TableViewModel(title: "oh yeah", image: UIImage(named: "DistanceIcon.png")) ,
            height: 84,
            selection: KSYCellSelectedAction(selectedAction: { (indexPath) in
                print("did Selected indexPath section: \(indexPath.section) row: \(indexPath.row)")
            }))
        
        let cell3 = KSYCellConfigurator<SwitcherTableViewCell>(
            viewModel: TableViewModel(title: "oh yeah switch", image: UIImage(named: "DistanceIcon.png")) ,
            height: 44)
```

* Register cells
``` Swift
        for section in item {
            for configure in section {
                self.tableView?.register(configure.cellClass.self, forCellReuseIdentifier: configure.reuseIdentifier)
            }
        }
```


* Implement tableView `DataSource` and `Delegate`, You can create a common file to Implement it because write once can run anywhere.

``` Swift
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let configure = items[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: configure.reuseIdentifier, for: indexPath)
        configure.config(cell)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let configure = items[indexPath.section][indexPath.row]
        return configure.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selection = items[indexPath.section][indexPath.row].selection {
            selection.didSelected(at: indexPath)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
```
