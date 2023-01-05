//
//  BaseViewModel.swift
//  myOwnSpace
//
//  Created by Ebbyy on 2022/12/31.
//

import Foundation

class BaseViewModel: ObservableObject {
    // MARK: - TAB BAR
    @Published var currentTab: Tab = .Home
    
    @Published var homeTab = "Facewash"
    
    // MARK: - DETAIL VIEW
  //  @Published var currentProduct: Product?
    @Published var showAddNewDiary = false
    @Published var showDetail = false
}

enum Tab: String {
    case Home = "house.fill"
    case Diary = "book.closed.fill"
    case Graph = "graph"
    case Setting = "setting"
}
