//
//  ViewController.swift
//  InterviewSolar
//
//  Created by Titi3012 on 19/03/2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var connectTableView: UITableView!
    var viewModel = InstructViewModel()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = UIColor(named: "background")
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            appearance.shadowColor = .clear
            appearance.shadowImage = UIImage()
            UINavigationBar.appearance().tintColor = .white
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        } else {
            UINavigationBar.appearance().barTintColor = UIColor(named: "background")
            UINavigationBar.appearance().tintColor = .white
            UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            if #available(iOS 11.0, *) {
                UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            }
            UINavigationBar.appearance().isTranslucent = false

            UINavigationBar.appearance().shadowImage = UIImage()
            UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        }
        UITableView.appearance().backgroundColor = .clear
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addNavBarTitle()
        viewModel.readFileData()
        setupTableView()
    }

    func addNavBarTitle() {
        var nameLabel = UILabel()
        nameLabel.text = "Instruction connect to TV"
        nameLabel.font = UIFont.systemFontCompactDisplay(.medium, size: 17)
        nameLabel.textColor = UIColor(named: "textColor")?.withAlphaComponent(0.9)
        navigationItem.titleView = nameLabel
        addNavBarLeft()
    }

    private func addNavBarLeft() {
        let closeButton = UIBarButtonItem(image: UIImage(named: "ic_arrow"),
                                          style: .done,
                                          target: self,
                                          action: nil)
        closeButton.tintColor = .black
        navigationItem.leftBarButtonItem = closeButton
    }

    private func setupTableView() {
        connectTableView.separatorStyle = .none
        connectTableView.registerNib(cellClass: ItemTableViewCell.self)
        connectTableView.delegate = self
        connectTableView.dataSource = self
        connectTableView.contentInset = UIEdgeInsets(top: 0, left: 0,
                                                     bottom: 0, right: 0)
        connectTableView.sectionHeaderTopPadding = 5
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.instructsData[section].instructs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(ofType: ItemTableViewCell.self)
        cell.setupData(viewModel.instructsData[indexPath.section].instructs[indexPath.row])
        cell.upImageViewClick = {
            self.viewModel.instructsData[indexPath.section].instructs[indexPath.row].collapsed = !(self.viewModel.instructsData[indexPath.section].instructs[indexPath.row].collapsed ?? false)
            cell.upImageView.image = self.viewModel.instructsData[indexPath.section].instructs[indexPath.row].collapsed ?? false ? UIImage(named: "ic_down") : UIImage(named: "ic_up")
            self.connectTableView.reloadData()
        }

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let data = viewModel.instructsData[indexPath.section].instructs[indexPath.row]
        print("Count Index : \(indexPath.row) : \(data.title?.count) --- \(data.description?.count)")
        if viewModel.instructsData[indexPath.section].instructs[indexPath.row].collapsed ?? false {
            return (CGFloat(ceil(Double(data.title?.count ?? 0) / 44.0) * 15.0) + CGFloat(ceil(Double(data.description?.count ?? 0) / 53.0) * 20.0) + 54.0)
        } else {
            print("show : \(ceil(Double(data.title?.count ?? 0) / 44.0)) --- \(CGFloat(ceil(Double(data.title?.count ?? 0) / 44.0) * 15.0))")
            return CGFloat(ceil(Double(data.title?.count ?? 0) / 44.0) * 15.0 + 44.0)
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.instructsData.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.instructsData[section].category
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let label = UILabel()
        label.font = UIFont.systemFontCompactDisplay(.medium, size: 16)
        label.textColor = .black
        label.text = self.tableView(tableView, titleForHeaderInSection: section)
        label.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = UIColor(named: "background")
        headerView.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            label.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 0),
            label.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -5),
        ])

        return headerView
    }
}
