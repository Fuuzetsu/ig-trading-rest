{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}
-- |
-- Copyright   : 2017, Mateusz Kowalczyk
-- License     : BSD3
-- Maintainer  : fuuzetsu@fuuzetsu.co.uk
-- Stability   : experimental
module Web.IG.Types.DealStatus
  ( DealStatus(..)
  ) where

import qualified Data.Aeson as Aeson
import qualified Data.Aeson.Types as Aeson (typeMismatch)
import           Data.Text (Text)
import           GHC.Generics (Generic)

-- | Deal status
data DealStatus =
    -- | Accepted
    ACCEPTED
    -- | Rejected
  | REJECTED
  deriving (Show, Eq, Ord, Generic)

instance Aeson.FromJSON DealStatus where
  parseJSON (Aeson.String "ACCEPTED") = pure ACCEPTED
  parseJSON (Aeson.String "REJECTED") = pure REJECTED
  parseJSON invalid = Aeson.typeMismatch "DealStatus" invalid

instance Aeson.ToJSON DealStatus where
  toEncoding ACCEPTED = Aeson.toEncoding ("ACCEPTED" :: Text)
  toEncoding REJECTED = Aeson.toEncoding ("REJECTED" :: Text)
