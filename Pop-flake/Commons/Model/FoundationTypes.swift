//
//  ModelTypes.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 09/02/2022.
//

import Foundation

struct List<T> {
    
    var items: [T] = []
    var isPaginable: Bool = false
    var currentPage: Int = 1
    
    var count: Int { return items.count }
    var isEmpty: Bool { return items.isEmpty }
    
    init() {}
    
    init(with items: [T]) {
        self.items = items
    }
    
    mutating func reset() {
        items.removeAll()
        isPaginable = false
        currentPage = 1
    }
    
    mutating func reset(isPagiable: Bool) {
        items.removeAll()
        self.isPaginable = isPagiable
        currentPage = 1
    }
    
    mutating func insert(_ newElement: T, at index: Int) {
        items.insert(newElement, at: index)
    }
    
    mutating func insert(contentsOf newElements: [T], at index: Int) {
        items.insert(contentsOf: newElements, at: index)
    }
    
    mutating func append(_ newElement: T) {
        items.append(newElement)
    }
    
    mutating func append(contentsOf: [T]) {
        items.append(contentsOf: contentsOf)
    }
    
    mutating func remove(at index: Int) {
        items.remove(at: index)
    }
    
    mutating func removeAll(_ item: T) where T: Equatable {
        items.removeAll() { value in return value == item }
    }
    
}
