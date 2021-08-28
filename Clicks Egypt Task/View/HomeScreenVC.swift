//
//  HomeScreenVC.swift
//  Clicks Egypt Task
//
//  Created by Admin on 26/08/2021.
//

import UIKit
import SearchTextField

class HomeScreenVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cardCell = "CardTableViewCell"
    var viewModel = ListViewModel()
    @IBOutlet weak var cardTableView: UITableView!
    @IBOutlet weak var text: SearchTextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpCardTableView()
        bindUI()
        cardTableView.separatorStyle = .none
        viewModel.getList()
    }
    func setUpCardTableView(){
        cardTableView.delegate = self
        cardTableView.dataSource = self
        let nib = UINib(nibName: cardCell, bundle: nil)
        cardTableView.register(nib, forCellReuseIdentifier: cardCell)
    }
    func bindUI() {
        viewModel.error = { error in
            self.Alert("Error", error?.localizedDescription.description ?? "")
        }
        viewModel.success = {
            self.cardTableView.reloadData()
            self.setupSearchFilter()
        }
        viewModel.refreshData = {
            self.cardTableView.reloadData()
        }
    }
    func setupSearchFilter() {
        DispatchQueue.main.async {
            self.text.setupRightImage(imageName: "search")

        }

        let filterStringsArray = viewModel.articals?.map({ (item) -> String in
            item.title ?? ""
        }) ?? []
        text.filterStrings(filterStringsArray)
        text.theme = SearchTextFieldTheme.darkTheme()
        // Modify current theme properties
        text.theme.font = UIFont.systemFont(ofSize: 15)
        text.theme.bgColor = UIColor.darkGray
        text.theme.borderColor = UIColor (red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        text.theme.separatorColor = UIColor (red: 0.9, green: 0.9, blue: 0.9, alpha: 0.5)
        text.theme.cellHeight = 50
        // Handle what happens when the user picks an item. By default the title is set to the text field
        text.itemSelectionHandler = {item, itemPosition in
            self.viewModel.getSearchItem(index: itemPosition)
        }
        text.userStoppedTypingHandler = {
         
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.articals?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cardTableView.dequeueReusableCell(withIdentifier: cardCell, for: indexPath) as! CardTableViewCell
        cell.bind(artical: viewModel.articals?[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "DetailsVC") as! DetailsVC
        vc.artical = viewModel.articals?[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }


}

