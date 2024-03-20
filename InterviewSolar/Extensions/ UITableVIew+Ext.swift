//
//   UITableVIew+Ext.swift   .swift
//  InterviewSolar
//
//  Created by Titi3012 on 19/03/2024.
//

import UIKit
protocol ReusableView: AnyObject { }

extension ReusableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }

    static var reuseIdentifier: String {
        return nibName
    }
}

extension UITableViewCell: ReusableView { }
extension UICollectionViewCell: ReusableView { }
extension UITableViewHeaderFooterView: ReusableView { }

extension UITableView {
    func registerNib<T: UITableViewCell>(cellClass: T.Type, bundle: Bundle? = nil) {
        let nib = UINib(nibName: String(describing: cellClass), bundle: bundle ?? Bundle(for: T.self))
        register(nib, forCellReuseIdentifier: cellClass.reuseIdentifier)
    }

    func register<T: UITableViewCell>(_: T.Type) {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }

        return cell
    }

    // swiftlint:disable force_cast
    public func dequeueCell<T: UITableViewCell>(ofType cellClass: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: cellClass.reuseIdentifier, for: indexPath) as! T
    }

    // swiftlint:disable force_cast
    public func dequeueCell<T: UITableViewCell>(ofType cellClass: T.Type) -> T {
        return dequeueReusableCell(withIdentifier: cellClass.reuseIdentifier) as! T
    }

    public func registerHeader<T: UITableViewHeaderFooterView>(_: T.Type) {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }

    public func dequeueReusableHeaderView<T: UITableViewHeaderFooterView>(with type: T.Type) -> T {
        guard let header = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return header
    }
}

extension UITableView {
    func setAndLayoutTableHeaderView(header: UIView?) {
        guard let header = header else {
            return
        }
        header.setNeedsLayout()
        header.layoutIfNeeded()
        let height = header.systemLayoutSizeFitting(CGSize(width: bounds.width, height: 0),
                                                    withHorizontalFittingPriority: UILayoutPriority.required,
                                                    verticalFittingPriority: UILayoutPriority.fittingSizeLevel).height
        var frame = header.frame
        frame.size.height = height
        header.frame = frame
        tableHeaderView = header
    }
}
