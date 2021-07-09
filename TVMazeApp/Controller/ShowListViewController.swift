//
//  ViewController.swift
//  TVMazeApp
//
//  Created by Dev on 09/07/21.
//

import UIKit
import Alamofire

class ShowListViewController: UIViewController {

    @IBOutlet var listCollectionView: UICollectionView!
    
    var pageNumber = 1
    var listArray = [ShowList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listCollectionView.delegate = self
        self.callShowListApi()
        
    }
    
    //MARK: -  API Request
    
    func callShowListApi() {
        let apiService = APIService()
        
        let param: Parameters = [
            "page" :  String(pageNumber)
        ]

        apiService.makeRequest(withType: .get, path: Appconstants.showList, params: param, returnType: [ShowList].self) { (result) in
            switch(result) {
            case .success(let response):
                self.listArray = response
                self.listCollectionView.reloadData()
            case .failure(let errorMessage):
                GenericFunctions.showAlert(targetVC: self, title: "", message: errorMessage)
            }
        }
    }
    
    //MARK: -  Segue transition

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailView" {
            if let indexPath = self.listCollectionView.indexPathsForSelectedItems {
                let detailsVC = segue.destination as? DetailViewController
                detailsVC?.modalPresentationStyle = .fullScreen
                detailsVC?.showDetail = self.listArray[indexPath[0][1]]
            }
        }
    }
    
}


//MARK:- UICollectionViewDelegate & UICollectionViewDataSource

extension ShowListViewController : UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "list", for: indexPath) as! ListCollectionViewCell
        cell.setupCellWith(self.listArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ((UIScreen.main.bounds.size.width - 30)/2), height: ((UIScreen.main.bounds.size.height - 100)/2.5))
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "DetailView", sender: self)
    }
}


