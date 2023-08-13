//
//  ImageCell.swift
//  hw14
//
//  Created by Dastan on 13.08.2023.
//

import UIKit
import SnapKit

class ImageCell: UICollectionViewCell {
    static let identifier = "ImageCell"
    
//    MARK: - UI Elements
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    public lazy var cellNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var imageCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        return label
    }()
    
//    MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        cellNameLabel.text = nil
    }
    
//    MARK: - Setups
    
    private func setupViews() {
        contentView.clipsToBounds = true
        contentView.addSubview(imageView)
        contentView.addSubview(cellNameLabel)
        contentView.addSubview(imageCountLabel)
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(170)
        }
        
        cellNameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(5)
            make.leading.equalToSuperview()
        }
        
        imageCountLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(25)
            make.leading.equalToSuperview()
        }
    }
    
    public func configure(with model: SectionModel) {
        imageView.image = model.image
        cellNameLabel.text = model.title
        imageCountLabel.text = model.imageCount
    }
}

