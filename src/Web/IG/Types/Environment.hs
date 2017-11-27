{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}
-- |
-- Copyright   : 2017, Mateusz Kowalczyk
-- License     : BSD3
-- Maintainer  : fuuzetsu@fuuzetsu.co.uk
-- Stability   : experimental
module Web.IG.Types.Environment
  ( Environment(..)
  ) where

import qualified Data.Aeson as Aeson
import qualified Data.Aeson.Types as Aeson (typeMismatch)
import           GHC.Generics (Generic)

-- | Describes the environment to be used as the rerouting destination
data Environment = DEMO | LIVE | TEST | UAT
  deriving (Show, Eq, Ord, Generic)

instance Aeson.FromJSON Environment where
  parseJSON (Aeson.String "DEMO") = pure DEMO
  parseJSON (Aeson.String "LIVE") = pure LIVE
  parseJSON (Aeson.String "TEST") = pure TEST
  parseJSON (Aeson.String "UAT") = pure UAT
  parseJSON invalid = Aeson.typeMismatch "Environment" invalid
