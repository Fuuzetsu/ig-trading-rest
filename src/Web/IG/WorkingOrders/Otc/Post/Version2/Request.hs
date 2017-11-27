{-# LANGUAGE DeriveGeneric #-}
-- |
-- Copyright   : 2017, Mateusz Kowalczyk
-- License     : BSD3
-- Maintainer  : fuuzetsu@fuuzetsu.co.uk
-- Stability   : experimental
module Web.IG.WorkingOrders.Otc.Post.Version2.Request
  ( Request(..)
  ) where

import qualified Data.Aeson as Aeson
import           Data.Text (Text)
import           GHC.Generics (Generic)
import           Web.IG.Types.Direction (Direction)
import           Web.IG.Types.Epic (Epic)
import           Web.IG.Types.OrderTimeInForce (OrderTimeInForce)
import           Web.IG.Types.WorkingOrderType (WorkingOrderType)

-- | Create working order request
--
-- [Constraint] If guaranteedStop equals true, then set only one of
-- stopDistance
--
-- [Constraint] If timeInForce equals GOOD_TILL_DATE, then set
-- goodTillDate
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
    -- | Instrument epic
    --
    -- [Constraint] NotNull
  , epic :: !Epic
    -- | Expiry
    --
    -- [Constraint] NotNull
    --
    -- [Constraint] Pattern(regexp="(\\d{2}-)?[A-Z]{3}-\\d{2}|-|DFB")
  , expiry :: !Text
    -- | Force open
  , forceOpen :: !(Maybe Bool)
    -- | Good till date - This accepts two possible formats either
    -- @yyyy/mm/dd hh:mm:ss@ in UTC Time or Unix Timestamp in
    -- milliseconds
    --
    -- [Constraint] Pattern(regexp="(\\d{4}/\\d{2}/\\d{2} \\d{2}:\\d{2}:\\d{2}|\\d*)")
  , goodTillDate :: !(Maybe Text)
    -- | Guaranteed stop
    --
    -- [Constraint] NotNull
  , guaranteedStop :: !Bool
    -- | Deal level
    --
    -- [Constraint] NotNull
  , level :: !Double
    -- | Limit distance
  , limitDistance :: !(Maybe Double)
    -- | Limit level
  , limitLevel :: !(Maybe Double)
    -- | Order size
    --
    -- [Constraint] NotNull
    --
    -- [Constraint] Check precision is not more than 12 decimal places
  , size :: !Double
    -- | Stop distance
  , stopDistance :: !(Maybe Double)
    -- | Stop level
  , stopLevel :: !(Maybe Double)
    -- | Time in force
  , timeInForce :: !OrderTimeInForce
    -- | Working order type
    --
    -- [Haskell API note] The original field name is @type@ but that's
    -- a Haskell keyword. The Haskell field has therefore been renamed
    -- to 'orderType'. The generated requests to IG API will use the
    -- appropriate field name of course.
  , orderType :: !WorkingOrderType
  } deriving (Show, Eq, Ord, Generic)
