//
//  ViewController.swift
//  CustomTabbarPractice
//
//  Created by 류창휘 on 2022/01/21.
//

import UIKit

class RootStackTabViewController: UIViewController {
    
    
    @IBOutlet weak var bottomStack: UIStackView!
    
    var currentIndex = 0
    
    lazy var tabs: [StackItemView] = {
        var items = [StackItemView]()
        for _ in 0..<5 {
            items.append(StackItemView.newInstance)
        }
        return items
    }()
    
    lazy var tabModels: [BottomStackItem] = {
        return [
            BottomStackItem(title: "Home", image: "home"),
            BottomStackItem(title: "Favorites", image: "heart"),
            BottomStackItem(title: "Search", image: "search"),
            BottomStackItem(title: "Profile", image: "user"),
            BottomStackItem(title: "Settings", image: "settings")
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()
    }

    func setupTabs() {
        for (index, model) in self.tabModels.enumerated() {
            let tabView = self.tabs[index]
            model.isSelected = index == 0
            tabView.item = model
            tabView.delegate = self
            self.bottomStack.addArrangedSubview(tabView)
        }
    }
    
    
}

extension RootStackTabViewController: StackItemViewDelegate {
    func handleTap(_ view: StackItemView) {
        self.tabs[self.currentIndex].isSelected = false
        view.isSelected = true
        self.currentIndex = self.tabs.firstIndex(where: { $0 === view }) ?? 0
    }
}
