import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean.OptimalCostFunctional

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean

structure ValueIteration (S : DiscreteControlSystem) (F : OptimalCostFunctional S) where
  valueFunction : S.stateSpace → ℝ
  bellmanUpdate : (S.stateSpace → ℝ) → (S.stateSpace → ℝ)
  convergence : Prop
  uniqueFixedPoint : Prop
  convergenceTerm : convergence
  uniqueFixedPointTerm : uniqueFixedPoint

structure ValueIterationEvidence {S : DiscreteControlSystem} {F : OptimalCostFunctional S}
    (V : ValueIteration S F) where
  convergenceClosed : V.convergence
  uniqueFixedPointClosed : V.uniqueFixedPoint

def ValueIterationClosed {S : DiscreteControlSystem} {F : OptimalCostFunctional S}
    (V : ValueIteration S F) : Prop :=
  V.convergence ∧ V.uniqueFixedPoint

theorem value_iteration_closed_from_evidence {S : DiscreteControlSystem}
    {F : OptimalCostFunctional S} (V : ValueIteration S F)
    (E : ValueIterationEvidence V) : ValueIterationClosed V := by
  exact And.intro E.convergenceClosed E.uniqueFixedPointClosed

end DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean
end HautevilleHouse
