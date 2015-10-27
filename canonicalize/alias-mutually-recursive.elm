type alias Comment =
  { message : String
  , upvotes : Int
  , downvotes : Int
  , responses : Responses
  }

type alias Responses =
  { sortBy : SortBy
  , responses : List Comment
  }

type SortBy = Time | Score | MostResponses