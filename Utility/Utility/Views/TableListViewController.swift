//
//  ViewController.swift
//  Utility
//
//  Created by Zhang, Wanming on 2/9/22.
//

import UIKit

class TableListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let imageCellId = "ImageTableCell"
    
    var viewModel: EmployeeViewModel
    
    required init?(coder: NSCoder) {
        let apiManager = EmployeeService()
        let viewModel = EmployeeViewModel(apiManager)
        self.viewModel = viewModel
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
        setupBinder()
        callToViewModelForUIUpdate()
    }
    
    func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: imageCellId, bundle: nil), forCellReuseIdentifier: imageCellId)
    }
    
    func setupBinder() {
        self.viewModel.employees.bind { [weak self] (_) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func callToViewModelForUIUpdate(){
        self.viewModel.getEmployeeData()
    }
}

extension TableListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.employees.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let employee = self.viewModel.employees.value[row]
        if let imgCell = tableView.dequeueReusableCell(withIdentifier: imageCellId) as? ImageTableCell {
            imgCell.updateCell(with: employee)
            return imgCell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
