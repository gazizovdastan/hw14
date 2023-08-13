//
//  HeaderSection.swift
//  hw14
//
//  Created by Dastan on 13.08.2023.
//

import UIKit
import SnapKit

class HeaderSection: UICollectionReusableView {
    static let identifier = "HeaderSection"

//    MARK: - UI Elements

    private lazy var separatorSectionView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    public lazy var leftHeaderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    public lazy var rightButton: UIButton = {
        let rightButton = UIButton(type: .system)
        rightButton.setTitleColor(UIColor.systemBlue, for: .normal)
        rightButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        return rightButton
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//    MARK: - Setups
    
    private func setupViews() {
        addSubview(separatorSectionView)
        addSubview(leftHeaderLabel)
        addSubview(rightButton)
    }
    
    private func setupConstraints() {
        separatorSectionView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(0.5)
        }
        leftHeaderLabel.snp.makeConstraints { make in
            make.top.equalTo(separatorSectionView.snp.bottom).offset(10)
            make.bottom.leading.trailing.equalToSuperview()
            
        }
        rightButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-15)
            make.centerY.equalTo(leftHeaderLabel.snp.centerY)
        }
    }
}

