{-# LANGUAGE DeriveGeneric #-}
-- |
-- Copyright   : 2017, Mateusz Kowalczyk
-- License     : BSD3
-- Maintainer  : fuuzetsu@fuuzetsu.co.uk
-- Stability   : experimental
module Web.IG.Types.Account
  ( Account(..)
  ) where

import qualified Data.Aeson as Aeson
import           Data.Text (Text)
import           GHC.Generics (Generic)
import           Web.IG.Types.AccountType (AccountType)

-- | Account details
data Account = Account
  { -- | Account identifier
    accountId :: !Text
    -- | Account name
  , accountName :: !Text
    -- | Account type
  , accountType :: !AccountType
    -- | Indicates whether this account is the client's preferred
    -- account
  , preferred :: !Bool
  } deriving (Show, Eq, Ord, Generic)

instance Aeson.FromJSON Account where
  parseJSON = Aeson.genericParseJSON Aeson.defaultOptions
