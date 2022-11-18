//
//  StartViewController.swift
//  myCrypto
//
//  Created by Yuriy on 16.11.2022.
//

import UIKit

class StartViewController: UITableViewController {
    
    private var crypto: Crypto?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "myCrypto"
        tableView.rowHeight = 65
        fetchCrypto()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        crypto?.data.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let cell = cell as? CustomViewCell else { return UITableViewCell() }
        
        let sortedCrypto = crypto?.data.sorted(by: {$0.quote.USD.price > $1.quote.USD.price})
        if let crypto = sortedCrypto?[indexPath.row] {
            cell.configure(with: crypto)
        }
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func fetchCrypto() {
        NetworkManager.shared.fetchCrypto(from: Link.cryptoUrl.rawValue) { [weak self] result in
            switch result {
            case .success(let crypto):
                self?.crypto = crypto
                self?.tableView.reloadData()
                print(crypto)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}
