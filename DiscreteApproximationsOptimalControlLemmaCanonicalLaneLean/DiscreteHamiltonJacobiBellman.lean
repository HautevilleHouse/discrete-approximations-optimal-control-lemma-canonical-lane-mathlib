import canonicalLaneMathlib.AdmissibleClass
import DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean.DiscreteDynamics

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean

structure DiscreteHJBEquation where
  valueFunction : DiscreteDynamicsPackage.stateSpace → ℝ
  bellmanOptimality : DiscreteDynamicsPackage.stateSpace → DiscreteDynamicsPackage.controlSpace → ℝ → Prop
  hjbPdeDiscrete : (DiscreteDynamicsPackage.stateSpace → ℝ) → Prop

structure DiscreteHJBEvidence (H : DiscreteHJBEquation) where
  valueFunctionDefined : Prop
  bellmanOptimalityHolds : Prop
  hjbPdeDiscreteClosed : H.hjbPdeDiscrete H.valueFunction

def DiscreteHJBClosed (H : DiscreteHJBEquation) : Prop :=
  H.bellmanOptimality (initialCondition) (if true then { val := 0, isLt := by decide } else { val := 1, isLt := by decide }) 0

end DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean
end HautevilleHouse