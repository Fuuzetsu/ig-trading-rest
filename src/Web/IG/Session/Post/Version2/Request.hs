{-# LANGUAGE DeriveGeneric #-}
-- |
-- Copyright   : 2017, Mateusz Kowalczyk
-- License     : BSD3
-- Maintainer  : fuuzetsu@fuuzetsu.co.uk
-- Stability   : experimental
--
-- Creates a trading session, obtaining session tokens for
-- subsequent API access.
--
-- Please note that region-specific
-- <https://labs.ig.com/loginrestrictions login restrictions> may
-- apply.
module Web.IG.Session.Post.Version2.Request
  ( Request(..)
  ) where

import           Data.Text (Text)
import           GHC.Generics (Generic)
import qualified Data.Aeson as Aeson

-- | Client login credentials
data Request = Request
  { -- | Whether the password has been sent encrypted.
    encryptedPassword :: !(Maybe Bool)
    -- | Client login identifier
    --
    -- [Constraint] NotNull
    -- [Constraint] Pattern(regexp="[A-Za-z0-9\\-_]{1,30}")
  , identifier :: !Text
    -- | Client login password
    --
    -- [Constraint] NotNull
    -- [Constraint] Pattern(regexp=".{1,350}")
  , password :: !Text
  } deriving (Show, Eq, Ord, Generic)

instance Aeson.ToJSON Request where
  toEncoding = Aeson.genericToEncoding Aeson.defaultOptions
