import com.google.inject.AbstractModule

import services.Piglet

class Module extends AbstractModule{
  override def configure():Unit = {
    bind(classOf[Piglet]).asEagerSingleton()
  }
}
