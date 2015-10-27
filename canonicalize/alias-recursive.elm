type alias Comment =
  { message : String
  , upvotes : Int
  , downvotes : Int
  , responses : List Comment
  }