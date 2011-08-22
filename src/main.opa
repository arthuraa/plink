package plink.main;

import plink.models.*;
import plink.controllers.*;

routes =
  | {path = [] ...} -> MainController.render()
  | {path = ["queries", id] ...} -> QueryController.show(id)
  | {path = _ ...} -> QueryController.new()

server = Server.simple_dispatch(routes)
