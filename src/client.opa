package plink.models.client

import plink.models.user

import stdlib.components.login

Client = {{

  credentials =
    authenticate(data, state) =
      match data with
      | {some = (email, password)} ->
        if Map.mem(email, /users) && /users[email]/password == password
        then {some = {some = /users[email]}}
        else {some = {none}}
      | {none} -> {none}
    CLogin.make(
      {none},
      CLogin.default_config("signin", authenticate)
    )

}}


