import Vapor

/// Controls basic CRUD operations on `Post`s.
final class PostController {
    /// Returns a list of all `Post`s.
    func index(_ req: Request) throws -> Future<[Post]> {
        return Post.query(on: req).all()
    }

    func show(_ req: Request) throws -> Future<Post> {
        return try req.parameters.next(Post.self)
    }
    /// Saves a decoded `Post` to the database.
    func create(_ req: Request) throws -> Future<Post> {
        return try req.content.decode(Post.self).flatMap { post in
            return post.save(on: req)
        }
    }

    func update(_ req: Request) throws -> Future<Post> {
        return try flatMap(to: Post.self, req.parameters.next(Post.self), req.content.decode(Post.self)) { post, updatedPost in
            post.title = updatedPost.title
            post.text = updatedPost.text
            return post.save(on: req)
        }
    }

    /// Deletes a parameterized `Post`.
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(Post.self).flatMap { post in
            return post.delete(on: req)
        }.transform(to: .ok)
    }
}
