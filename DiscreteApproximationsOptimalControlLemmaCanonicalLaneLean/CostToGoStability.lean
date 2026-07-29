import canonicalLaneMathlib.AdmissibleClass
import DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean.DiscreteTrajectoryPackage

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean

structure CostToGoPackage {dtp : DiscreteTrajectoryPackage} where
  costToGoFunction : dtp.stateSpace → ℝ
  optimalCostToGo : dtp.stateSpace → ℝ
  bellmanRecursion : Prop
  contractionProperty : Prop

structure CostToGoEvidence {dtp : DiscreteTrajectoryPackage} (ctg : CostToGoPackage dtp) where
  bellmanRecursionClosed : ctg.bellmanRecursion
  contractionPropertyClosed : ctg.contractionProperty

def CostToGoClosed {dtp : DiscreteTrajectoryPackage} (ctg : CostToGoPackage dtp) : Prop :=
  ctg.bellmanRecursion ∧ ctg.contractionProperty

theorem cost_to_go_closed_from_evidence {dtp : DiscreteTrajectoryPackage} (ctg : CostToGoPackage dtp) (E : CostToGoEvidence ctg) : CostToGoClosed ctg := by
  exact And.intro E.bellmanRecursionClosed E.contractionPropertyClosed

end DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean
end HautevilleHouse