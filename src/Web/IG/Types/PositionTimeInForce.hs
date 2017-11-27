{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}
-- |
-- Copyright   : 2017, Mateusz Kowalczyk
-- License     : BSD3
-- Maintainer  : fuuzetsu@fuuzetsu.co.uk
-- Stability   : experimental
module Web.IG.Types.PositionTimeInForce
  ( PositionTimeInForce(..)
  ) where

import qualified Data.Aeson as Aeson
import qualified Data.Aeson.Types as Aeson (typeMismatch)
import           Data.Text (Text)
import           GHC.Generics (Generic)

-- | The time in force determines the order fill strategy.
data PositionTimeInForce =
    -- | Execute and eliminate
    EXECUTE_AND_ELIMINATE
    -- | Fill or kill
  | FILL_OR_KILL
  deriving (Show, Eq, Ord, Generic)

instance Aeson.ToJSON PositionTimeInForce where
  toEncoding EXECUTE_AND_ELIMINATE =
    Aeson.toEncoding ("EXECUTE_AND_ELIMINATE" :: Text)
  toEncoding FILL_OR_KILL =
    Aeson.toEncoding ("FILL_OR_KILL" :: Text)

instance Aeson.FromJSON PositionTimeInForce where
  parseJSON (Aeson.String "EXECUTE_AND_ELIMINATE") = pure EXECUTE_AND_ELIMINATE
  parseJSON (Aeson.String "FILL_OR_KILL") = pure FILL_OR_KILL
  parseJSON invalid = Aeson.typeMismatch "PositionTimeInForce" invalid
