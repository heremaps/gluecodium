// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2019 HERE Europe B.V.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// SPDX-License-Identifier: Apache-2.0
// License-Filename: LICENSE
//
// -------------------------------------------------------------------------------------------------

import UIKit

class MenuTableViewController: UITableViewController {

    let versionMessage = "Swift Hello World - \(UIApplication.shared.versionBuild())"

    //(Display name, Storyboard name)
    let dataSource: [(label: String, controlerName: String)] = [
        ("Base", "Base"),
        ("Builtin Types", "BuiltinTypes"),
        ("Instances", "Instances"),
        ("Structs", "Structs"),
        ("Structs with defaults", "Defaults"),
        ("Enums", "Enums"),
        ("Typedefs", "Typedefs"),
        ("Attributes", "Attributes"),
        ("Arrays", "Arrays"),
        ("Listeners", "Listeners"),
        ("Errors", "Errors"),
        ("Inheritance", "Inheritance"),
        ("Maps", "Maps"),
        ("Equatable", "Equatable")]

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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row].label
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let info = dataSource[indexPath.row]
        let viewController = UIStoryboard.mainInstance(name: info.controlerName)
        viewController.title = info.0
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
