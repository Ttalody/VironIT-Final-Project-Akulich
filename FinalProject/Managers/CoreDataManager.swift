//
//  CoreDataManager.swift
//  FinalProject
//
//  Created by user on 27.09.2022.
//

import CoreData
import UIKit

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    func addItem(with model: GameResponseModel, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let item = GameItem(context: context)
        
        item.id = Int64(model.id)
        item.name = model.name
        item.backgroundImage = model.backgroundImage
        item.releaseDate = model.releaseDate
        item.rating = model.rating ?? 0
        item.ratingsCount = Int64(model.ratingsCount ?? 0)
        item.metacrtitcRating = model.metacriticRating ?? 0
        
        do {
            try context.save()
            completion(.success(()))
        } catch {
            context.rollback()
            completion(.failure(error))
        }
    }
    
    func fetchGamesFromDatabase(completion: @escaping (Result<[GameItem], Error>) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request: NSFetchRequest<GameItem>
        
        request = GameItem.fetchRequest()
        
        do {
            let games = try context.fetch(request)
            completion(.success(games))
        } catch {
            completion(.failure(error))
        }
    }
    
    func deleteItem(with model: GameItem, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let context = appDelegate.persistentContainer.viewContext
        
        context.delete(model)
        
        do {
            try context.save()
            completion(.success(()))
        } catch {
            completion(.failure(error))
        }
    }
}
