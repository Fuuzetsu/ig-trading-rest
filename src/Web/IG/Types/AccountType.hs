{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}
-- |
-- Copyright   : 2017, Mateusz Kowalczyk
-- License     : BSD3
-- Maintainer  : fuuzetsu@fuuzetsu.co.uk
-- Stability   : experimental
module Web.IG.Types.AccountType
  ( AccountType(..)
  ) where

import qualified Data.Aeson as Aeson
import qualified Data.Aeson.Types as Aeson (typeMismatch)
import           GHC.Generics (Generic)

-- | Account type
data AccountType =
    -- | CFD account
    CFD
    -- | Physical account
  | PHYSICAL
    -- | Spread bet account
  | SPREADBET
  deriving (Show, Eq, Ord, Generic)

instance Aeson.FromJSON AccountType where
  parseJSON (Aeson.String "CFD") = pure CFD
  parseJSON (Aeson.String "PHYSICAL") = pure PHYSICAL
  parseJSON (Aeson.String "SPREADBET") = pure SPREADBET
  parseJSON invalid = Aeson.typeMismatch "AccountType" invalid
