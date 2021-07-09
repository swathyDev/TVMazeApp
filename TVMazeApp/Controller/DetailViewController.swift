//
//  DetailViewController.swift
//  TVMazeApp
//
//  Created by Dev on 09/07/21.
//

import UIKit
import Alamofire
import SDWebImage

class DetailViewController: UIViewController {

    @IBOutlet var seasonCollection: UICollectionView!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var urlLabel: UILabel!
    @IBOutlet var siteLabel: UILabel!
    @IBOutlet var runTimeLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var showImageView: UIImageView!
    @IBOutlet var backGroundImage: UIImageView!
    
    var showDetail : ShowList!
    var seasonArray = [ShowList]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        self.listSeasonAPI()
        
    }

    //MARK: -  API Request
    
    func listSeasonAPI() {
        let apiService = APIService()
        apiService.makeRequest(withType: .get, path: Appconstants.seasonList, params: [:], returnType: [ShowList].self) { (result) in
            switch(result) {
            case .success(let response):
                self.seasonArray =  response
                self.seasonCollection.reloadData()
            case .failure(let errorMessage):
                GenericFunctions.showAlert(targetVC: self, title: "", message: errorMessage)
            }
        }
    }
    
    //MARK: - IBOutlets

    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: -  Setup UI Components

    func setUpUI() {
        titleLabel.text = self.showDetail?.name ?? ""
        descriptionLabel.attributedText = (self.showDetail?.summary ?? "").htmlToAttributedString
        descriptionLabel.font = UIFont(name: "Helvetica Neue - Bold", size: 18.0)
        descriptionLabel.textColor = UIColor.white
        showImageView?.sd_setImage(with: URL(string: self.showDetail?.image?.original ?? ""), placeholderImage: nil)
        backGroundImage?.sd_setImage(with: URL(string: self.showDetail?.image?.original ?? ""), placeholderImage: nil)
        statusLabel.text = self.showDetail?.status ?? ""
        dateLabel.text = self.showDetail?.premiered ?? ""
        runTimeLabel.text = String(self.showDetail?.runtime ?? 0)
        siteLabel.text = self.showDetail?.officialSite ?? ""
        urlLabel.text = self.showDetail?.url ?? ""
        ratingLabel.text = String(self.showDetail?.rating?.average ?? 0)
    }
}

//MARK:- UICollectionViewDelegate & UICollectionViewDataSource

extension DetailViewController : UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.seasonArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "season", for: indexPath) as! SeasonCollectionViewCell
        cell.setupCellWith((indexPath.row) + 1)
        return cell
    }
}



extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
