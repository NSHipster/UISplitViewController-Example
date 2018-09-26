import UIKit

class ColorsViewController: UITableViewController {
    var collapseDetailViewController: Bool = true
    
    // MARK: - UIViewController
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationController = segue.destination as? UINavigationController,
            let viewController = navigationController.topViewController as? ColorViewController
        else {
            fatalError()
        }
        
        viewController.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
        viewController.navigationItem.leftItemsSupplementBackButton = true
        
        if let selectedRowIndexPath = tableView.indexPathForSelectedRow {
            viewController.color = namedColors[selectedRowIndexPath.row]
        }
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namedColors.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let (name, _) = namedColors[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = name
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.collapseDetailViewController = false
    }
}

