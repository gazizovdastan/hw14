//
//  ViewController.swift
//  hw14
//
//  Created by Dastan on 13.08.2023.
//

import UIKit
import SnapKit

class MyAlbumsViewController: UIViewController {
    private var models = [[SectionModel]]()
    
//    MARK: - UI Elements
    
    private lazy var layout: UICollectionViewCompositionalLayout = {
        let layout = createCompositionalLayout()
        return layout
    }()
    
    private lazy var collectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HeaderSection.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderSection.identifier)
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: ImageCell.identifier)
        collectionView.register(BasicCell.self, forCellWithReuseIdentifier: BasicCell.identifier)
        return collectionView
    }()
    
//    MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Альбомы"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: nil)
        
        setupViews()
        setupConstraints()
        setupCells()
    }
    
//    MARK: - Setups
    
    private func setupViews() {
        view.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func setupCells() {
        models.append(contentsOf: [
        [SectionModel(image: UIImage(named: "nazik"), title: "Недавние", imageCount: "2019"),
        SectionModel(image: UIImage(named: "tokaev"), title: "Избранное", imageCount: "7"),
        SectionModel(image: UIImage(named: "jacky"), title: "Джеки Чан", imageCount: "32"),
        SectionModel(image: UIImage(named: "lee"), title: "Брюс Ли", imageCount: "84"),
        SectionModel(image: UIImage(named: "ali"), title: "Мухаммад Али", imageCount: "13")
        ],
        [SectionModel(image: UIImage(named: "people"), title: "Люди", imageCount: "115"),
        SectionModel(image: UIImage(named: "place"), title: "Места", imageCount: "2")
        ],
        [SectionModel(image: UIImage(systemName: "video"), title: "Видео", imageCount: "407"),
         SectionModel(image: UIImage(systemName: "person.crop.square"), title: "Селфи", imageCount: "94"),
         SectionModel(image: UIImage(systemName: "livephoto"), title: "Фото Live Photos", imageCount: "50"),
         SectionModel(image: UIImage(systemName: "cube"), title: "Портреты", imageCount: "41"),
         SectionModel(image: UIImage(systemName: "timelapse"), title: "Таймлапс", imageCount: "2"),
         SectionModel(image: UIImage(systemName: "slowmo"), title: "Замедленно", imageCount: "1"),
         SectionModel(image: UIImage(systemName: "camera.viewfinder"), title: "Снимки экрана", imageCount: "159"),
         SectionModel(image: UIImage(systemName: "record.circle"), title: "Записи экрана", imageCount: "17")
        ],
        [SectionModel(image: UIImage(systemName: "square.and.arrow.down"), title: "Импортированные", imageCount: "165"),
        SectionModel(image: UIImage(systemName: "eye.slash"), title: "Скрытые", imageCount: "46"),
        SectionModel(image: UIImage(systemName: "trash"), title: "Недавно удаленные", imageCount: "0")
        ]])
    }
}

extension MyAlbumsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func  collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch indexPath.section {
        case 0:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderSection.identifier, for: indexPath) as? HeaderSection else { fatalError("invalid header") }
            header.leftHeaderLabel.text = "Мои альбомы"
            header.rightButton.setTitle("Всe", for: .normal)
            return header
        case 1:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderSection.identifier, for: indexPath) as? HeaderSection else { fatalError("invalid header") }
            header.leftHeaderLabel.text = "Люди и места"
            header.rightButton.setTitle("", for: .normal)
            return header
        case 2:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderSection.identifier, for: indexPath) as? HeaderSection else { fatalError("invalid header") }
            header.leftHeaderLabel.text = "Типы медиафайлов"
            header.rightButton.setTitle("", for: .normal)
            return header
        case 3:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderSection.identifier, for: indexPath) as? HeaderSection else { fatalError("invalid header") }
            header.leftHeaderLabel.text = "Другое"
            header.rightButton.setTitle("", for: .normal)
            return header
        default:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderSection.identifier, for: indexPath) as? HeaderSection else { fatalError("invalid header") }
            header.leftHeaderLabel.text = "Альбом по умолчанию"
            return header
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return models[section].count
        case 1: return models[section].count
        case 2: return models[section].count
        case 3: return models[section].count
        default: return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = models[indexPath.section][indexPath.row]
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath) as? ImageCell else { fatalError("invalid cell") }
            cell.backgroundColor = .systemBackground
            cell.configure(with: model)
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath) as? ImageCell else { fatalError("invalid cell") }
            cell.backgroundColor = .systemBackground
            cell.configure(with: model)
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BasicCell.identifier, for: indexPath) as? BasicCell else { fatalError("invalid cell") }
            cell.backgroundColor = .systemBackground
            cell.configure(with: model)
            if indexPath.item == models[indexPath.section].count - 1{
                cell.separatorCellView.isHidden = true
            }
            return cell
        case 3:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BasicCell.identifier, for: indexPath) as? BasicCell else { fatalError("invalid cell") }
            cell.backgroundColor = .systemBackground
            cell.configure(with: model)
            if indexPath.item == models[indexPath.section].count - 1 {
                cell.separatorCellView.isHidden = true
            }
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath)
            cell.backgroundColor = .systemBackground
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        switch indexPath.section {
        case 0:
            let cell = collectionView.cellForItem(at: indexPath) as! ImageCell
            print(cell.cellNameLabel.text!)
        case 1:
            let cell = collectionView.cellForItem(at: indexPath) as! ImageCell
            print(cell.cellNameLabel.text!)
        case 2:
            let cell = collectionView.cellForItem(at: indexPath) as! BasicCell
            print(cell.cellNameLabel.text!)
        case 3:
            let cell = collectionView.cellForItem(at: indexPath) as! BasicCell
            print(cell.cellNameLabel.text!)
        default:
            let cell = collectionView.cellForItem(at: indexPath) as! BasicCell
            print(cell.cellNameLabel.text!)
        }
    }
}

extension MyAlbumsViewController {
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            switch sectionIndex {
            case 0:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 0, trailing: 5)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.46),
                                                       heightDimension: .fractionalWidth(1.2))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 2)
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0)
                section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 0
                let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                    heightDimension: .estimated(1))
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: sectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                sectionHeader.contentInsets.leading = CGFloat(5)
                section.boundarySupplementaryItems = [sectionHeader]
                return section
            case 1:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)

                item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 0, trailing: 5)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.92),
                                                       heightDimension: .fractionalWidth(0.6))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10)
                section.orthogonalScrollingBehavior = .paging
                section.interGroupSpacing = 5
                let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                    heightDimension: .estimated(1))
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: sectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                sectionHeader.contentInsets.leading = CGFloat(5)
                section.boundarySupplementaryItems = [sectionHeader]
                return section
            case 2:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                       heightDimension: .absolute(44))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0)
                let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                    heightDimension: .estimated(1))
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: sectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                sectionHeader.contentInsets.leading = CGFloat(5)
                section.boundarySupplementaryItems = [sectionHeader]
                return section
            case 3:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                       heightDimension: .absolute(44))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)

                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0)
                
                let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1))
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                sectionHeader.contentInsets.leading = CGFloat(5)
                section.boundarySupplementaryItems = [sectionHeader]
                return section
            default:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 0)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 2.2),
                                                       heightDimension: .fractionalWidth(1 / 1.8 * 2))
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: 2)
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
                layoutSection.orthogonalScrollingBehavior = .groupPaging
                let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                    heightDimension: .estimated(1))
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: sectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                sectionHeader.contentInsets.leading = CGFloat(5)
                layoutSection.boundarySupplementaryItems = [sectionHeader]
                return layoutSection
            }
        }
        return layout
    }
}
