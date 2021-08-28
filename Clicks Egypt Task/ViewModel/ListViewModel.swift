//
//  ListViewModel.swift
//  Clicks Egypt Task
//
//  Created by Admin on 27/08/2021.
//

import Foundation


class ListViewModel {
    
    var articalFullData: [Articles]?
    var articals: [Articles]?
    var success: (() -> Void)?
    var error: ((Error?) -> Void)?
    var refreshData: (() -> Void)?
    
    func getList(){
        Services.shared.GetData(url: Constants.baseURL.rawValue + Constants.articalListURL.rawValue, parameters: nil, headers: header) { [weak self] (data: ArticalModel?,error: Error?) in
            guard let self = self else {return}
            if let error = error {
                self.error?(error)
                print(error.localizedDescription)
            }else{
                if let unwrappedData = data{
                    self.articals = unwrappedData.articles
                    self.articalFullData = unwrappedData.articles
                    self.success?()
                    print(unwrappedData)
                }
            }
        }
    }
    
    func getSearchItem(index: Int) {
        self.articals = []
        guard let item = articalFullData?[index] else {return}
        self.articals?.append(item)
        refreshData?()
    }
    
}
