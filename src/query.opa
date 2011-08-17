package plink.models.query;

import plink.models.link;

type Query.query = {term: string; links: list(Link.link)};

db /queries : stringmap(Query.query)

Query = {{
  path(id) =
    { path = ["queries", id]
    ; fragment = {none}
    ; query = []
    ; is_directory = false
    ; is_from_root = true }
}}

