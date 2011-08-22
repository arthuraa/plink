package plink.models.user;

type User.t = {email: string; password: string};

db /users : stringmap(User.t)

User = {{

  save(user) =
    if Map.mem(user.email, /users)
    then false
    else do /users[user.email] <- user
         true

}}

