module Site.Core
  ( stripContent
  , stripStatic
  , (+||+)
  )
where

import           Hakyll

stripContent :: Routes
stripContent = stripRoute "content/"

stripRoute :: String -> Routes
stripRoute ptrn = gsubRoute ptrn $ const ""

stripStatic :: Routes
stripStatic = stripRoute "static/"

-- | Infix version of 'composeRoutes'.
(+||+) :: Routes -> Routes -> Routes
(+||+) = composeRoutes
