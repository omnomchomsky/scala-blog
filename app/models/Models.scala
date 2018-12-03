package models

import akka.http.javadsl.model.headers.Date
import akka.http.javadsl.model.DateTime
abstract class Models
case class Author(username:String, password:String, email:String) extends Models
