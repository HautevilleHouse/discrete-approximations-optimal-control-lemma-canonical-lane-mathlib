import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean

structure ConsistencyErrorBounds where
  spatialStep : ℝ
  timeStep : ℝ
  localTruncationError : ℝ
  stabilityCondition : ℝ → Prop

structure ConsistencyErrorEvidence (C : ConsistencyErrorBounds) where
  localTruncationErrorBound : C.localTruncationError ≤ 0.1
  stabilityConditionHolds : C.stabilityCondition (C.spatialStep)

def ConsistencyErrorClosed (C : ConsistencyErrorBounds) : Prop :=
  C.stabilityCondition (C.spatialStep) ∧ C.localTruncationError ≤ 0.1

end DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean
end HautevilleHouse