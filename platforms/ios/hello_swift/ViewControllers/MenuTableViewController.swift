//
//  MenuTableViewController.swift
//  hello_swift
///
//  Copyright © 2017 HERE. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {

    let versionMessage = "Swift Hello World - \(UIApplication.shared.versionBuild())"

    //(Display name, Storyboard name)
    let dataSource = [("Base", "Base"),
                      ("Builtin Types", "BuiltinTypes"),
                      ("Instances", "Instances"),
                      ("Structs", "Structs"),
                      ("Enums", "Enums"),
                      ("Typedefs", "Typedefs"),
                      ("Attributes", "Attributes"),
                      ("Arrays", "Arrays"),
                      ("Listeners", "Listeners")]

    @IBOutlet weak var versionLabel: UILabel! {
        willSet { newValue.text = versionMessage }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? MainMenuCell else {
            fatalError("Cell can not be created. Review your cells identifier")
        }
        cell.configure(title: dataSource[indexPath.row].0)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let info = dataSource[indexPath.row]
        let viewController = UIStoryboard.mainInstance(name: info.1)
        viewController.title = info.0
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
