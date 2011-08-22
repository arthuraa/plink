package plink.models.query;

import plink.models.link;

type Query.t = {term: string; links: list(Link.t)};

db /queries : stringmap(Query.t)

Query = {{
  path(id) =
    { path = ["queries", id]
    ; fragment = {none}
    ; query = []
    ; is_directory = false
    ; is_from_root = true }
}}

