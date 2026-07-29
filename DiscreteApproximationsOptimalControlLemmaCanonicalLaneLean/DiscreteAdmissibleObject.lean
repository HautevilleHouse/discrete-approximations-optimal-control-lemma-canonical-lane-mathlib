import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure DiscreteSpace where
  carrier : Type
  discreteTopology : TopologicalSpace carrier

structure DiscreteAdmittedObject where
  space : DiscreteSpace
  controlSystem : DiscreteControlSystem
  proposedOptimalControl : controlSystem.controlSpace
  optimalValue : ℝ
  epsilonOptimal : ℝ
  valueInequality : optimalValue ≤ controlSystem.cost (controlSystem.dynamics) (proposedOptimalControl) + epsilonOptimal
  conclusion : valueInequality

structure DiscreteEndgameState where
  object : DiscreteAdmittedObject

def DiscreteWitnessClosed (O : DiscreteAdmittedObject) : Prop :=
  O.valueInequality

end DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean
end HautevilleHouse
