//
//  CollectionViewController.swift
//  Utility
//
//  Created by Zhang, Wanming on 9/6/22.
//

import UIKit

class CollectionViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    let imageCellId = "ImageCollectionCell"
    let viewModel: EmployeeViewModel
    
    required init?(coder: NSCoder) {
        let apiManager = EmployeeService()
        let model = EmployeeViewModel(apiManager)
        self.viewModel = model
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupBinder()
        callToViewModelForUIUpdate()
    }

    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: imageCellId, bundle: nil), forCellWithReuseIdentifier: imageCellId)
    }
    
    func setupBinder() {
        viewModel.employees.bind { [weak self] employees in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    func callToViewModelForUIUpdate() {
        viewModel.getEmployeeData()
    }
}

extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.employees.value.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let placeHolderCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let employees = self.viewModel.employees.value
        let row = indexPath.row
        let employee = employees[row]
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: imageCellId, for: indexPath) as?
            ImageCollectionCell {
            cell.updateWith(employee)
            return cell
        }
        
        return placeHolderCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.size.width - 20
        let height: CGFloat = 60
        return CGSize(width: width, height: height)
    }
}
