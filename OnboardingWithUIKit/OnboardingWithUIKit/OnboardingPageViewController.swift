//
//  OnboardingPageViewController.swift
//  OnboardingWithUIKit
//
//  Created by seobyeonggwan on 2023/01/13.
//

import UIKit

class OnboardingPageViewController: UIPageViewController {

    var pages = [UIViewController]()
    var bottomButtonMargin: NSLayoutConstraint?
    var pageControl = UIPageControl()
    let startIndex = 0
    var currentIndex = 0 {
        didSet {
            pageControl.currentPage = currentIndex
        }
    }
    
    func makeVC() {
        let itemVC1 = OnboardingItemViewController(nibName: "OnboardingItemViewController", bundle: nil)
        
        itemVC1.topImage = UIImage(named: "onboarding1")
        itemVC1.mainText = "Focus on your ideal buyer"
        itemVC1.subText = "When you write a product description with a huge crowd of buyers in mind, your descriptions become wishy-washy and you end up addressing no one at all"
        
        let itemVC2 = OnboardingItemViewController(nibName: "OnboardingItemViewController", bundle: nil)
        
        itemVC2.topImage = UIImage(named: "onboarding2")
        itemVC2.mainText = "Entice with Benefits"
        
        let itemVC3 = OnboardingItemViewController(nibName: "OnboardingItemViewController", bundle: nil)
        
        itemVC3.topImage = UIImage(named: "onboarding3")
        itemVC3.mainText = "Avoid yeah, yeah phrases"
        
        pages.append(itemVC1)
        pages.append(itemVC2)
        pages.append(itemVC3)
        
        setViewControllers([itemVC1], direction: .forward, animated: true)
        
        self.dataSource = self
        self.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        makeVC()
        makeBottomButton()
        makePageControl()
    }
    
    func makeBottomButton() {
        let button = UIButton()
        button.setTitle("Confirm", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(dismissPageVC), for: .touchUpInside)
        
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        bottomButtonMargin = button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        
        bottomButtonMargin?.isActive = true
        hideButton()
    }
    
    @objc func pageControlTapped(sender: UIPageControl) {
        if sender.currentPage > self.currentIndex {
            self.setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true)
        } else {
            self.setViewControllers([pages[sender.currentPage]], direction: .reverse, animated: true)
        }
        
        currentIndex = sender.currentPage
        
        buttonPresentationStyle()
    }
    
    @objc func dismissPageVC() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func makePageControl() {
        self.view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .systemGray6
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = startIndex
        
        //pageControl 클릭으로 화면전환
//        pageControl.isUserInteractionEnabled = false
        
        pageControl.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -80).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        
        pageControl.addTarget(self, action: #selector(pageControlTapped), for: .valueChanged)
    }
    
    
}

extension OnboardingPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        self.currentIndex = currentIndex
        
        if currentIndex == 0 {
            return pages.last
        } else {
            return pages[currentIndex - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        self.currentIndex = currentIndex
        
        if currentIndex == pages.count - 1 {
            return pages.first
        } else {
            return pages[currentIndex + 1]
        }
    }
}

extension OnboardingPageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard let currentVC = pageViewController.viewControllers?.first else { return }
        
        guard let currentIndex = pages.firstIndex(of: currentVC) else { return }
        
        self.currentIndex = currentIndex
        
        buttonPresentationStyle()
    }
    
    func buttonPresentationStyle() {
        if currentIndex == pages.count - 1 {
            self.showButton()
        } else {
            self.hideButton()
        }
        
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.2, delay: 0, options: [.curveEaseInOut], animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func showButton() {
        bottomButtonMargin?.constant = 0
    }
    
    func hideButton() {
        bottomButtonMargin?.constant = 100
    }
}
