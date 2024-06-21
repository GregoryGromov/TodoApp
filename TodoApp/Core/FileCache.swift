import Foundation

class FileCache {
    
    private var todoItems: [TodoItem]
    
    init(todoItems: [TodoItem]) {
        self.todoItems = todoItems
    }
    
    func getTodoItems() -> [TodoItem] {
        return todoItems
    }
    
    func addTodoItem(_ todoItem: TodoItem) {
        if noSameItem(withId: todoItem.id) {
            todoItems.append(todoItem)
        }
        
    }
    
    func deleteTodoItem(byId id: String) {
        for index in todoItems.indices {
            if todoItems[index].id == id {
                todoItems.remove(at: index)
                return
            }
        }
    }
    
    private func noSameItem(withId id: String) -> Bool {
        for item in todoItems {
            if item.id == id {
                return false
            }
        }
        
        return true
    }
    
    
    func saveTodoItemsToFile() throws {
        
        let arrayOfJSONs = todoItems.map { $0.json }
        
        do {
            try FileManagerService.shared.writeDataToFile(withName: "todoItems", data: arrayOfJSONs)
        } catch {
            print("Error saving todoItems to file, error: \(error)")
            throw error
        }
    }
    
    
    func getTodoItemsFromFile() throws {
        
        guard let data = FileManagerService.shared.readDataFromFile(withName: "todoItems") else { return }
        
        
        do {
            if let dataAsJSON = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                
                
//           -->
                var todoItemsFromFile: [TodoItem] = []
                
                for itemAsJSON in dataAsJSON {
                    if let todoItem = TodoItem.parse(json: itemAsJSON) {
                        todoItemsFromFile.append(todoItem)
                    }
                }
                todoItems = todoItemsFromFile
//           -->
                
//                ВОПРОС: как сделать выделенный блок (--> ... <--) кода короче?
//                Казалось бы, можно как-то так:

//                todoItems = dataAsJSON.map { TodoItem.parse(json: $0)! }
                
//                Но так делать нельзя, потому что в проде не рекомендуюется использовать ! для unwrapped optional
//                То есть возможно ли безопсано развернуть optional в короткой записи?
                
            }
            
        } catch {
            print("Ошибка при преобразовании Data в [[String: Any]]: \(error.localizedDescription)")
            throw error
        }
        
    }
}
