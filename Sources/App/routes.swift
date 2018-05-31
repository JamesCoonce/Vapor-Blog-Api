import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }

    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)

    let postController = PostController()
    router.get("posts", use: postController.index)
    router.get("posts", Post.parameter, use: postController.show)
    router.post("posts", use: postController.create)
    router.put("posts", Post.parameter, use: postController.update)
    router.delete("posts", Post.parameter, use: postController.delete)
}
