import XCTest
@testable import ToDoAppYandex

final class TodoItemTests: XCTestCase {

//    Тестируем var json: Any
    func testSuccessfulJSONEncoding() {

        // Given
        let todoItem = TodoItem(id: "idtest1", text: "Помыть посуду", isDone: false, dateCreation: Date(timeIntervalSince1970: 1234))

        // Act
        guard let todoAsJSON = todoItem.json as? [String: Any] else {
            XCTFail("Failed to convert JSON to [String: Any]")
            return
        }

        // Then
        
//      Мы не можем сделать так:
//          let todoItemAsJSON = todoItem.json
//          XCTAssertEqual(todoItemAsJSON as! [String : Any], 1)
//      поэтому приходится проверять каждый компонент отдельно:
        
        XCTAssertEqual(todoAsJSON["id"] as? String, "idtest1")
        XCTAssertEqual(todoAsJSON["text"] as? String, "Помыть посуду")
        XCTAssertNil(todoAsJSON["importance"])
        XCTAssertNil(todoAsJSON["deadline"])
        XCTAssertEqual(todoAsJSON["isDone"] as? Bool, false)
        XCTAssertEqual(todoAsJSON["dateCreation"] as? String, "1970-01-01 03:20:34")
        XCTAssertNil(todoAsJSON["dateChanging"])
    }
    
//    Тестируем static func parse(json: Any) -> TodoItem?
    func testSuccessfulJSONParsing() {
        
//        Given
        let inputJSON = [
            "id": "idTest2",
            "text": "Доделать домашку",
            "isDone": true,
            "dateCreation": "1970-01-01 03:20:34"
        ] as [String : Any]
        
//        Act
        let parsedJSON = TodoItem.parse(json: inputJSON)
        
//      Then
        
//      Мы не можем сделать так, так как для этого необходимо, чтобы TodoItem соответствовал Equatable
//          XCTAssertEqual(parsedJSON, TodoItem(id: "idTest2", text: "Доделать домашку", isDone: true, dateCreation: Date(timeIntervalSince1970: 1234)))
//      Поэтому придется сравнивать все компоненты отдельно
        
        XCTAssertNotNil(parsedJSON)
        
        XCTAssertEqual(parsedJSON?.id, "idTest2")
        XCTAssertEqual(parsedJSON?.text, "Доделать домашку")
        XCTAssertEqual(parsedJSON?.isDone, true)
        XCTAssertEqual(parsedJSON?.dateCreation, Date(timeIntervalSince1970: 1234))
        
        XCTAssertNil(parsedJSON?.importance)
        XCTAssertNil(parsedJSON?.dateChanging)
        XCTAssertNil(parsedJSON?.deadline)
 
    }
    
//    Тестируем static func parseCSV(_ csvString: String) -> [TodoItem]?
    func testSuccessfulCSVParcing() {
        
    }
        
        
        
    

}
