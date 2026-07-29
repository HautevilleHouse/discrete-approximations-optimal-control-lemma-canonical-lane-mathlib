import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean

structure AdmittedObject where
  stateSpace : Type
  controlSpace : Type
  dynamics : stateSpace → controlSpace → stateSpace
  cost : stateSpace → controlSpace → ℝ
  optimalValue : ℝ
  optimalityCondition : Prop
  optimalityConditionTerm : optimalityCondition

end DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean
end HautevilleHouse
