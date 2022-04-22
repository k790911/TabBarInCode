//
//  ViewController.swift
//  TabBarInCode
//
//  Created by 김재훈 on 2022/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    var button: UIButton = {
        let b = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 52))
        b.setTitle("Log In", for: .normal)
        b.backgroundColor = .white
        b.setTitleColor(.black, for: .normal)
        return b
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemBlue
        view.addSubview(button)
        button.addTarget(self,
                         action: #selector(didTabButton),
                         for: .touchUpInside)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.center = view.center
    }
    
    @objc func didTabButton() {
        // Create and present tab bar controller
        
        let tabBarVC = UITabBarController()
        
        let vc1 = UINavigationController(rootViewController: FirstViewController())
        let vc2 = UINavigationController(rootViewController: SecondViewController())
        let vc3 = UINavigationController(rootViewController: ThirdViewController())
        let vc4 = UINavigationController(rootViewController: FourthViewController())
        let vc5 = UINavigationController(rootViewController: FifthViewController())
        
        vc1.navigationBar.backgroundColor = .white
        vc2.navigationBar.backgroundColor = .white
        vc3.navigationBar.backgroundColor = .white
        vc4.navigationBar.backgroundColor = .white
        vc5.navigationBar.backgroundColor = .white
        
        vc1.title = "Home"
        vc2.title = "Contact"
        vc3.title = "Help"
        vc4.title = "About"
        vc5.title = "Settings"
        
        tabBarVC.setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: false)
        
        guard let items = tabBarVC.tabBar.items else { return }
        
        let images = ["house", "bell", "person.circle", "star", "gear"]
        
        for x in 0 ..< items.count {
            items[x].badgeValue = "1"
            items[x].image = UIImage(systemName: images[x])
        }
        tabBarVC.tabBar.backgroundColor = .white
        tabBarVC.modalPresentationStyle = .fullScreen
        
        present(tabBarVC, animated: true)
    }

}

class FirstViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .lightGray
        title = "HOME"
    }
}

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .orange
        title = "CONTACT"
    }
}

class ThirdViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .yellow
        title = "HELP"
    }
}

class FourthViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .green
        title = "ABOUT"
    }
}

class FifthViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .blue
        title = "SETTINGS"
    }
}
