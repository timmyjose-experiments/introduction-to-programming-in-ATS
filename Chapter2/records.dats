#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

typedef
point2D = @{ x = double, y = double }

typedef
person = '{ name = string, age = uint, salary = double }

typedef
point3D = @{ x = double, y = double, z = double }

implement main0 () = {
  val somePoint = @{ x = 200.12, y = ~123.88 } : point2D
  val @{ x = theX, y = theY } = somePoint
  val _ = print(theX)
  val _ = print("\n")
  val _ = print(theY)
  val _ = print("\n")
  val theXStill = somePoint.x and theYStill = somePoint.y
  val _ = print(theXStill)
  val _ = print("\n")
  val _ = print(theYStill)
  val _ = print("\n")

  val bob = '{ name = "Bob", age = g0i2u(42), salary = 12345.12 } : person
  val '{ name = bobName, age = bobAge, salary = bobSalary } = bob
  val _ = print(bobName)
  val _ = print("\n")
  val _ = print(bobAge)
  val _ = print("\n")
  val _ = print(bobSalary)
  val _ = print("\n")

  val pixel = @{ x = 100.0, y = 200.0, z = 300.0 } : point3D
  val @{ x = xCoord, ...} = pixel
  val @{ y = yCoord, ...} = pixel
  val @{ z = zCoord, ...} = pixel
  val _ = print(xCoord)
  val _ = print("\n")
  val _ = print(yCoord)
  val _ = print("\n")
  val _ = print(zCoord)
  val _ = print("\n")
}