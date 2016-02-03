{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module WebApp where

import Data.Text
import Servant.API


type UserAPI = "users" :> QueryParam "sortby" SortBy :> Get '[JSON] [User]
          :<|> "users" :> ReqBody '[JSON] User :> Post '[JSON] [User] 
          :<|> "users" :> Capture "userId" Integer :> Get '[JSON] User

data SortBy = Age | Name

data User = User {
  name :: String,
  age :: Int
}
