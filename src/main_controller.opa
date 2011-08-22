package plink.controllers.main

import plink.models.user

MainController = {{

  render() =
    Resource.page(
      "Welcome",
      <div id=#content>
        <a onclick={_ -> signup()}>Sign up</> or
        <a onclick={_ -> signin()}>sign in</>.
      </>
    )

  render_signup() =
    <input id=#email placeholder="Email" />
    <input id=password type="password" placeholder="Password" />
    <button onclick={_ -> handle_signup()}>Sign up</>

  signup() =
    Dom.transform([#content <- render_signup()])

  handle_signup() =
    user = {
      email = Dom.get_value(#email)
      password = Dom.get_value(#password)
    }
    if User.save(user)
    then Dom.transform([#content +<- <>Signed up successfully!</>])
    else Dom.transform([#content +<- <>Sign up failed!</>])

  signin() = void

}}
