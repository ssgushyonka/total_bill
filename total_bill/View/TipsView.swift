import UIKit
import Foundation

class TipsView: UIView {
    
    let titleLable: UILabel = {
        let label = UILabel()
        label.text = "Чаевые"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let tipsArray = ["0%", "10%", "15%", "20%"]
    
    let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
//        collectionViewLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
        setDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLable)
        addSubview(collectionView)
        collectionView.register(TipsCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}

extension TipsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.height / 1.25,
               height: collectionView.frame.height / 1.25)
    }
}

extension TipsView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? TipsCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.procentLabel.text = tipsArray[indexPath.row]
        return cell
    }
}

extension TipsView {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLable.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            titleLable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            collectionView.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 2),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            collectionView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
}
