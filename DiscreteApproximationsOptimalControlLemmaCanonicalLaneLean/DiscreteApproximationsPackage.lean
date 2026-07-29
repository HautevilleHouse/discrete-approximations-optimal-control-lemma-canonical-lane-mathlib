import DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean.AdmittedObject

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean

structure DiscreteApproximationsPackage where
  stateSpace : Type
  controlSpace : Type
  cost : stateSpace → controlSpace → ℝ
  dynamics : stateSpace → controlSpace → stateSpace
  discretizationStep : ℝ
  convergence : Prop
  convergenceTerm : convergence

structure DiscreteApproximationsEvidence (P : DiscreteApproximationsPackage) where
  convergenceClosed : P.convergence

def DiscreteApproximationsClosed (P : DiscreteApproximationsPackage) : Prop :=
  P.convergence

theorem discrete_approximations_closed_from_evidence
    (P : DiscreteApproximationsPackage) (E : DiscreteApproximationsEvidence P) :
    DiscreteApproximationsClosed P := by
  exact E.convergenceClosed

end DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean
end HautevilleHouse
