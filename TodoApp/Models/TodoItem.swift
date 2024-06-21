import Foundation

struct TodoItem: Identifiable {
    
    var id = UUID().uuidString
    
    var text: String
    var importance: Importance?
    var deadline: Date?
    var isDone: Bool
    
    let dateCreation: Date
    var dateChanging: Date?
    
    
//    кастомный инициализатор необходим, так как нам нужно иметь возможность как вручную давать id (напрмер, при распарсинге), так и автоматически
    init(id: String = UUID().uuidString, text: String, importance: Importance? = nil, deadline: Date? = nil, isDone: Bool, dateCreation: Date, dateChanging: Date? = nil) {
        self.id = id
        self.text = text
        self.importance = importance
        self.deadline = deadline
        self.isDone = isDone
        
        self.dateCreation = dateCreation
        self.dateChanging = dateChanging
    }
}














