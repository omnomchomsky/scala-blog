package controllers

import dao.AuthorDAO
import models.Author
import org.joda.time.DateTime

import javax.inject._
import play.api.data.Form
import play.api.data.Forms.date
import play.api.data.Forms.mapping
import play.api.data.Forms.text
import play.api._
import play.api.mvc._

import scala.concurrent.ExecutionContext

import services.Piglet
import slick.driver.MySQLDriver
/**
 * This controller creates an `Action` to handle HTTP requests to the
 * application's home page.
 */
@Singleton
class BlogController @Inject()(authorDao:AuthorDAO, cc: ControllerComponents, piggy: Piglet)(implicit executionContext: ExecutionContext) extends AbstractController(cc) {
  /**
   * Create an Action to render an HTML page.
   *
   * The configuration in the `routes` file means that this method
   * will be called when the application receives a `GET` request with
   * a path of `/`.
   */
  def authors = Action.async {
    authorDao.all().map { case (authors) => Ok(views.html.authors(authors)) }
  }

  val authorForm = Form(
    mapping(
      "username" -> text(),
      "password" -> text(),
      "email"    -> text()
     )(Author.apply)(Author.unapply)
   )

  def insertAuthor = Action.async { implicit request =>
    val author: Author = authorForm.bindFromRequest.get
    authorDao.insert(author).map(_ => Redirect(routes.BlogController.authors))
  }

  def piglet() = Action { implicit request: Request[AnyContent] =>
    Ok(views.html.piggy(piggy.count))
  }
}
