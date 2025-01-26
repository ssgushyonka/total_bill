
import UIKit
import Foundation

class TipsCollectionViewCell: UICollectionViewCell {
    
    let procentLabel: UILabel = {
        let label = UILabel()
        label.text = "10%"
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        backgroundColor = #colorLiteral(red: 0.8862745098, green: 0.8862745098, blue: 0.8588235294, alpha: 1)
        layer.cornerRadius = 10
        addSubview(procentLabel)
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            procentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
            procentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
            procentLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

