{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}
-- |
-- Copyright   : 2017, Mateusz Kowalczyk
-- License     : BSD3
-- Maintainer  : fuuzetsu@fuuzetsu.co.uk
-- Stability   : experimental
module Web.IG.Types.OrderTimeInForce
  ( OrderTimeInForce(..)
  ) where

import qualified Data.Aeson as Aeson
import qualified Data.Aeson.Types as Aeson (typeMismatch)
import           Data.Text (Text)
import           GHC.Generics (Generic)

-- | Time in force
data OrderTimeInForce =
    -- | Good until cancelled
    GOOD_TILL_CANCELLED
    -- | Good until specified date
    --
    -- [Haskell API note] The specified date mentioned here is usually
    -- contained in the type containing a 'OrderTimeInForce' field.
  | GOOD_TILL_DATE
  deriving (Show, Eq, Ord, Generic)

instance Aeson.ToJSON OrderTimeInForce where
  toEncoding GOOD_TILL_CANCELLED =
    Aeson.toEncoding ("GOOD_TILL_CANCELLED" :: Text)
  toEncoding GOOD_TILL_DATE =
    Aeson.toEncoding ("GOOD_TILL_DATE" :: Text)

instance Aeson.FromJSON OrderTimeInForce where
  parseJSON (Aeson.String "GOOD_TILL_CANCELLED") = pure GOOD_TILL_CANCELLED
  parseJSON (Aeson.String "GOOD_TILL_DATE") = pure GOOD_TILL_DATE
  parseJSON invalid = Aeson.typeMismatch "OrderTimeInForce" invalid
