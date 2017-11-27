{-# LANGUAGE DeriveGeneric #-}
-- |
-- Copyright   : 2017, Mateusz Kowalczyk
-- License     : BSD3
-- Maintainer  : fuuzetsu@fuuzetsu.co.uk
-- Stability   : experimental
module Web.IG.Session.RefreshToken.Post.Version1.Request
  ( Request(..)
  ) where

import qualified Data.Aeson as Aeson
import           Data.Text (Text)
import           GHC.Generics (Generic)

-- | Refresh session request
newtype Request = Request
  { -- | Refresh token
    --
    -- [Constraint] NotNull
    refresh_token :: Text
  } deriving (Show, Eq, Ord, Generic)

instance Aeson.ToJSON Request where
  toEncoding = Aeson.genericToEncoding Aeson.defaultOptions
