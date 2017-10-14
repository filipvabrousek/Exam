//
//  ViewController.swift
//  Drag-and-drop
//
//  Created by Filip Vabroušek on 01.10.17.
//  Copyright © 2017 Filip Vabroušek. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextDragDelegate, UITableViewDropDelegate {
    
    @IBOutlet var textView: UITextView!
    @IBOutlet var tableView: UITableView!
    
    var data = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.dropDelegate = self as? UITableViewDropDelegate
        textView.textDragDelegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    
    
    /*----------------------------------------------------------------DRAG PREVIEW FRO LIFTING ITEM----------------------------------------------------------------*/
    func textDraggableView(_ textDraggableView: UIView & UITextDraggable, dragPreviewForLiftingItem item: UIDragItem, session: UIDragSession) -> UITargetedDragPreview? {
        
        let imgView = UIImageView(image: UIImage(named: "hand.jpg"))
        imgView.backgroundColor = UIColor.clear
        
        let dragPoint = session.location(in: textDraggableView)
        let target = UIDragPreviewTarget(container: textDraggableView, center: dragPoint)
        return UITargetedDragPreview(view: imgView, parameters: UIDragPreviewParameters(), target: target)
    }
    
    
    
    /*------------------------------------------------------------------------ITEM FOR DRAG--------------------------------------------------------------------*/
    func textDraggableView(_ textDraggableView: UIView & UITextDraggable, itemsForDrag dragRequest: UITextDragRequest) -> [UIDragItem] {
        
        if let draggedString = textView.text(in: dragRequest.dragRange){
            let itemProvider = NSItemProvider(object: draggedString as NSItemProviderWriting)
            return [UIDragItem(itemProvider: itemProvider)]
        } else {
            return []
        }
    }
    
    /*------------------------------------------------------------------------PERFORM DROP WITH-------------------------------------------------------------------*/
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        var destIndexPath: IndexPath
        
        if let indexPath = coordinator.destinationIndexPath {
            destIndexPath = indexPath
        } else {
            let row = tableView.numberOfRows(inSection: 0)
            destIndexPath = IndexPath(row: row, section: 0)
        }
        coordinator.session.loadObjects(ofClass: NSString.self) { (items) in
            guard let arr = items as? [String] else {return}
            let str = arr.first
            self.data.insert(str!, at: destIndexPath.row)
            tableView.insertRows(at: [destIndexPath], with: .automatic)
        }
    }
    
}
