{-# LANGUAGE DeriveGeneric #-}
-- |
-- Copyright   : 2017, Mateusz Kowalczyk
-- License     : BSD3
-- Maintainer  : fuuzetsu@fuuzetsu.co.uk
-- Stability   : experimental
module Web.IG.Session.RefreshToken.Post.Version1.Response
  ( Response(..)
  ) where

import qualified Data.Aeson as Aeson
import           Data.Text (Text)
import           GHC.Generics (Generic)

-- | Refresh session request
data Response = Response
  { -- | Access token
    access_token :: !Text
    -- | Access token expiry in seconds
  , expires_in :: !Text
    -- | Refresh token
  , refresh_token :: !Text
    -- | Scope of the access token
  , scope :: !Text
    -- | Token type
  , token_type :: !Text
  } deriving (Show, Eq, Ord, Generic)

instance Aeson.FromJSON Response where
  parseJSON = Aeson.genericParseJSON Aeson.defaultOptions
