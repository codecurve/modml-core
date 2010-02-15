import BasicDAEModel
import BasicDAESolver

mymodelBuilder = do
  x <- newRealVariable
  y <- newRealVariable
  (derivative (x .**. (realConstant 2))) `newEq` (realConstant 10)
  (y .+. (x .*. y)) `newEq` (realConstant 5)
  newForcedInequality (x)
  newCheckedCondition "X out of range" (x .<. (realConstant 10))

mymodel = buildModel mymodelBuilder
showCode (Left err) = show err
showCode (Right code) = showString code "\n"
main = putStr $ showCode $ makeCodeFor mymodel