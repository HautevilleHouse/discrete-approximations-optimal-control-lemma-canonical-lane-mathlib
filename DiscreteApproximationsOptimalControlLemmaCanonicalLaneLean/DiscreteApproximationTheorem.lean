import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean.ValueIteration

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean

structure DiscreteApproximationTheorem (S : DiscreteControlSystem) (F : OptimalCostFunctional S)
    (V : ValueIteration S F) where
  costApproximationError : ℝ
  stateDiscretization : Type
  controlDiscretization : Type
  errorBound : Prop
  convergenceRate : Prop
  errorBoundTerm : errorBound
  convergenceRateTerm : convergenceRate

structure DiscreteApproximationTheoremEvidence {S : DiscreteControlSystem}
    {F : OptimalCostFunctional S} {V : ValueIteration S F}
    (D : DiscreteApproximationTheorem S F V) where
  errorBoundClosed : D.errorBound
  convergenceRateClosed : D.convergenceRate

def DiscreteApproximationTheoremClosed {S : DiscreteControlSystem}
    {F : OptimalCostFunctional S} {V : ValueIteration S F}
    (D : DiscreteApproximationTheorem S F V) : Prop :=
  D.errorBound ∧ D.convergenceRate

theorem discrete_approximation_theorem_closed_from_evidence {S : DiscreteControlSystem}
    {F : OptimalCostFunctional S} {V : ValueIteration S F}
    (D : DiscreteApproximationTheorem S F V) (E : DiscreteApproximationTheoremEvidence D) :
    DiscreteApproximationTheoremClosed D := by
  exact And.intro E.errorBoundClosed E.convergenceRateClosed

end DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean
end HautevilleHouse
