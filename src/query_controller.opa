package plink.controllers.query;

import plink.models.query;
import stdlib.web.client;

QueryController = {{

new() = Resource.page("New query",
  <h1>What do you want to know?</>
  <input id=#term />
  <button onclick={_ -> save()}>Ask!</>
  <h1>Other queries</>
  <ul>{
    StringMap.mapi(id, query ->
      <li><a href="{Uri.to_string(Query.path(id))}">{query.term}</></>,
      /queries
    ) |> StringMap.To.val_list
  }</>
)

save() =
  id = Random.string(8)
  term = Dom.get_value(#term)
  do /queries[id] <- {~term links=[]}
  Client.go(Query.path(id))

show(id) =
  query = /queries[id]
  Resource.page(query.term,
    <h1>{query.term}</>
    <ul>{
      List.map(link ->
        <li><a href="{link.address}">{link.address}</>  {link.comment}</>,
        query.links
      )
    }</>
    <>Link: </><input id=#address />
    <>Comment: </><input id=#comment />
    <button onclick={_ -> send_link(id)}>Send!</>
  )

send_link(id) =
  address = Dom.get_value(#address)
  comment = Dom.get_value(#comment)
  link = ~{address comment}
  query = /queries[id]
  do /queries[id] <- {query with links=List.cons(link, query.links)}
  Client.go(Query.path(id))

}}
