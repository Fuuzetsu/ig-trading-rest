{-# LANGUAGE DeriveGeneric #-}
-- |
-- Copyright   : 2017, Mateusz Kowalczyk
-- License     : BSD3
-- Maintainer  : fuuzetsu@fuuzetsu.co.uk
-- Stability   : experimental
module Web.IG.Positions.Otc.Post.Version2.Request
  ( Request(..)
  ) where

import qualified Data.Aeson as Aeson
import           Data.Text (Text)
import           GHC.Generics (Generic)
import           Web.IG.Types.Direction (Direction)
import           Web.IG.Types.Epic (Epic)
import           Web.IG.Types.PositionOrderType (PositionOrderType)
import           Web.IG.Types.PositionTimeInForce (PositionTimeInForce)

-- | Create position request
--
-- [Constraint] If a limitDistance is set, then forceOpen must be true
--
-- [Constraint] If a limitLevel is set, then forceOpen must be true
--
-- [Constraint] If a stopDistance is set, then forceOpen must be true
--
-- [Constraint] If a stopLevel is set, then forceOpen must be true
--
-- [Constraint] If guaranteedStop equals true, then set only one of
-- stopLevel,stopDistance
--
-- [Constraint] If orderType equals LIMIT, then DO NOT set quoteId
--
-- [Constraint] If orderType equals LIMIT, then set level
--
-- [Constraint] If orderType equals MARKET, then DO NOT set
-- level,quoteId
--
-- [Constraint] If orderType equals QUOTE, then set level,quoteId
--
-- [Constraint] If trailingStop equals false, then DO NOT set
-- trailingStopIncrement
--
-- [Constraint] If trailingStop equals true, then DO NOT set stopLevel
--
-- [Constraint] If trailingStop equals true, then guaranteedStop must
-- be false
--
-- [Constraint] If trailingStop equals true, then set
-- stopDistance,trailingStopIncrement
--
-- [Constraint] Set only one of {limitLevel,limitDistance}
--
-- [Constraint] Set only one of {stopLevel,stopDistance}
data Request = Request
  { -- | Currency. Restricted to available instrument currencies
    --
    -- [Constraint] NotNull
    --
    -- [Constraint] Pattern(regexp="[A-Z]{3}")
    currencyCode :: !Text
    -- | A user-defined reference identifying the submission of the order
    --
    -- [Constraint] Pattern(regexp="[A-Za-z0-9_\\-]{1,30}")
  , dealReference :: !(Maybe Text)
    -- | Deal direction
  , direction :: !Direction
    -- | Instrument epic identifier
    --
    -- [Constraint] NotNull
    --
    -- [Constraint] Pattern(regexp="[A-Za-z0-9._]{6,30}")
  , epic :: !Epic
    -- | Instrument expiry
    --
    -- [Constraint] NotNull
    --
    -- [Constraint] Pattern(regexp="(\\d{2}-)?[A-Z]{3}-\\d{2}|-|DFB")
  , expiry :: !Text
    -- | True if force open is required
    --
    -- [Constraint] NotNull
  , forceOpen :: !Bool
    -- | True if a guaranteed stop is required
    --
    -- [Constraint] NotNull
  , guaranteedStop :: !Bool
    -- | Deal level
  , level :: !Double
    -- | Limit distance
  , limitDistance :: !(Maybe Double)
    -- | Limit level
  , limitLevel :: !(Maybe Double)
    -- | Describes the order level model to be used for a position operation
  , orderType :: !PositionOrderType
    -- | Lightstreamer price quote identifier
  , quoteId :: !(Maybe Text)
    -- | Deal size
    --
    -- [Constraint] NotNull
    --
    -- [Constraint] Check precision is not more than 12 decimal places
  , size :: !Double
    -- | Stop distance
  , stopDistance :: !(Maybe Double)
    -- | Stop level
  , stopLevel :: !(Maybe Double)
    -- | The time in force determines the order fill strategy.
  , timeInForce :: !PositionTimeInForce
    -- | Whether the stop has to be moved towards the current level in
    -- case of a favourable trade
  , trailingStop :: !Bool
    -- | increment step in pips for the trailing stop
  , trailingStopIncrement :: !(Maybe Double)
  } deriving (Show, Eq, Ord, Generic)

instance Aeson.ToJSON Request where
  toEncoding = Aeson.genericToEncoding Aeson.defaultOptions
