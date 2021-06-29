//
//  ProductDetailView.swift
//  Poke-Commerce
//
//  Created by Lucas M Soares on 25/06/21.
//

import UIKit
import Alamofire
import AlamofireImage

class ProductDetailView: UIViewController {
    
    @IBOutlet private weak var background: UIImageView!
    @IBOutlet private weak var pokemonDescription: UILabel!
    @IBOutlet private weak var price: UILabel!
    @IBOutlet private weak var pokemonImage: UIImageView!
    @IBOutlet private weak var types: UILabel!
    @IBOutlet private weak var weakness: UILabel!
    @IBOutlet private weak var typesBotMargin: NSLayoutConstraint!
    @IBOutlet private weak var weaknessBotMargin: NSLayoutConstraint!
    
    private lazy var presenter: ProductDetailPresenter = {
        ProductDetailPresenter(view: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
        self.customLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.customLayout()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "store",
           let storeView = (segue.destination as? StoreView) {
            
            storeView.setProductDetail(with: self.presenter.getProductDetail())
        }
    }
}

// MARK: - Private methods

extension ProductDetailView {
    
    private func customLayout() {
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    private func updateBackground(image: UIImage) {
        self.background.image = image
    }
    
    private func showTypes(images: [UIImage]) {
        
        var y: CGFloat = 25
        let margins = self.view.layoutMarginsGuide
        
        for image in images {
            
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            self.view.addSubview(imageView)
            
            imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
            imageView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: -10).isActive = true
            imageView.bottomAnchor.constraint(equalTo: types.bottomAnchor, constant: y).isActive = true
            
            y += 25
        }
    }
    
    private func showWeakness(images: [UIImage]) {
        
        var y: CGFloat = 25
        let margins = self.view.layoutMarginsGuide
        
        for image in images {
            
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            self.view.addSubview(imageView)
            
            imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
            imageView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 10).isActive = true
            imageView.bottomAnchor.constraint(equalTo: weakness.bottomAnchor, constant: y).isActive = true
            
            y += 25
        }
    }
}

// MARK: - Actions

extension ProductDetailView {
    
    @IBAction func buyTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "store", sender: self)
    }
}

extension ProductDetailView: ProductDetailViewProtocol {
    
    func setProductDetail(with productDetail: ProductDetail?) {
        self.presenter.setProductDetail(with: productDetail)
    }
    
    func fillOutlets(with item: ProductDetail) {
        
        self.title = item.name
        self.pokemonDescription.text = item.description
        self.price.text = item.price
        
        AF.request(item.image).responseImage { response in
            if case .success(let image) = response.result {
                self.pokemonImage.image = image
            }
        }
        
        self.updateBackground(image: item.background)
        self.showTypes(images: item.types)
        self.showWeakness(images: item.weakness)
    }
    
    func presentStoreView(viewController: UIViewController) {
//        self.present(viewController, animated: true, completion: nil)
    }
}
