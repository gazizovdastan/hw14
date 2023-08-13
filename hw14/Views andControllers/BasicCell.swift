//
//  BasicCell.swift
//  hw14
//
//  Created by Dastan on 13.08.2023.
//

import UIKit
import SnapKit

class BasicCell: UICollectionViewCell {
    static let identifier = "BasicCell"
    
//    MARK: - UI Elements
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        return imageView
    }()

    public lazy var cellNameLabel: UILabel = {
        let leftlabel = UILabel()
        leftlabel.textColor = .systemBlue
        leftlabel.font = .systemFont(ofSize: 20, weight: .regular)
        return leftlabel
    }()

    private lazy var imageCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        return label
    }()

    private lazy var arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .systemGray
        return imageView
    }()
    
    public lazy var separatorCellView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
//    MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        selectedBackgroundView = UIView()
        selectedBackgroundView?.backgroundColor = .lightGray
        contentView.clipsToBounds = true
        contentView.addSubview(imageView)
        contentView.addSubview(cellNameLabel)
        contentView.addSubview(imageCountLabel)
        contentView.addSubview(arrowImageView)
        contentView.addSubview(separatorCellView)
    }

    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.centerY.equalToSuperview()
            make.height.equalTo(10)
            make.width.equalTo(10)
        }
        cellNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(15)
            make.centerY.equalToSuperview()
        }
        arrowImageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview()
            make.height.equalTo(16)
            make.width.equalTo(8)
        }
        imageCountLabel.snp.makeConstraints { make in
            make.trailing.equalTo(arrowImageView.snp.leading).offset(-5)
            make.centerY.equalToSuperview()
        }
        separatorCellView.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(10)
            make.trailing.bottom.equalToSuperview()
            make.height.equalTo(0.5)
        }
    }
    
    public func configure(with model: SectionModel) {
        imageView.image = model.image
        cellNameLabel.text = model.title
        imageCountLabel.text = model.imageCount
    }
}

