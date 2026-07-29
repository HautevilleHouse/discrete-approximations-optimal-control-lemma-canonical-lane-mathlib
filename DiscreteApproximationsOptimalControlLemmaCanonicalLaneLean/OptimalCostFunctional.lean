import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean.DiscreteControlSystem

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean

structure OptimalCostFunctional (S : DiscreteControlSystem) where
  runningCost : S.stateSpace → S.controlSpace → ℝ
  terminalCost : S.stateSpace → ℝ
  totalCost : (S.controlSpace → S.stateSpace) → ℝ
  costAdditive : Prop
  positiveCost : Prop
  costAdditiveTerm : costAdditive
  positiveCostTerm : positiveCost

structure OptimalCostFunctionalEvidence {S : DiscreteControlSystem}
    (F : OptimalCostFunctional S) where
  costAdditiveClosed : F.costAdditive
  positiveCostClosed : F.positiveCost

def OptimalCostFunctionalClosed {S : DiscreteControlSystem} (F : OptimalCostFunctional S) : Prop :=
  F.costAdditive ∧ F.positiveCost

theorem optimal_cost_functional_closed_from_evidence {S : DiscreteControlSystem}
    (F : OptimalCostFunctional S) (E : OptimalCostFunctionalEvidence F) :
    OptimalCostFunctionalClosed F := by
  exact And.intro E.costAdditiveClosed E.positiveCostClosed

end DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean
end HautevilleHouse
