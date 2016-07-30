{-# LANGUAGE ForeignFunctionInterface #-}

import Foreign
import Foreign.C.Types

{-
  Common Types:
  CChar
  CUChar
  CInt
  CUInt
  CLong
  CULong
  CSize
  CFloat
  CDouble
-}

-- import
foreign import ccall "math.h sin"
  c_sin :: CDouble -> CDouble

-- wrapper
fastsin :: Double -> Double
fastsin x = realToFrac (c_sin (realToFrac x))
