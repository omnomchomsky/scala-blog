package dao

import org.joda.time.DateTime

import scala.concurrent.{ExecutionContext, Future}
import javax.inject.Inject

import models.Author
import play.api.db.slick.DatabaseConfigProvider
import play.api.db.slick.HasDatabaseConfigProvider
import slick.jdbc.JdbcProfile

class AuthorDAO @Inject() (protected val dbConfigProvider: DatabaseConfigProvider)(implicit executionContext: ExecutionContext) extends HasDatabaseConfigProvider[JdbcProfile] {
  import profile.api._

  private val authors = TableQuery[AuthorsTable]
  def all(): Future[Seq[Author]] = db.run(authors.result)

  def insert(author: Author): Future[Unit] = db.run(authors += author).map { _ => () }
  
  private class AuthorsTable(tag: Tag) extends Table[Author](tag, "Author") {
    def username = column[String]("username")
    def password = column[String]("password")
    def email    = column[String]("email")

    def * = (username, password, email) <> (Author.tupled, Author.unapply)
  }
}

