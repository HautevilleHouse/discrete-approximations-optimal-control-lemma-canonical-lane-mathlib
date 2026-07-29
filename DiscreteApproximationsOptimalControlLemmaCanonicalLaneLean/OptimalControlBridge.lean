import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean.DiscreteApproximationTheorem

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean

structure OptimalControlBridge (S : DiscreteControlSystem) (F : OptimalCostFunctional S)
    (V : ValueIteration S F) (D : DiscreteApproximationTheorem S F V) where
  continuousOptimalControl : Prop
  discreteOptimalControl : Prop
  approximationRelationship : Prop
  continuousOptimalControlTerm : continuousOptimalControl
  discreteOptimalControlTerm : discreteOptimalControl
  approximationRelationshipTerm : approximationRelationship

structure OptimalControlBridgeEvidence {S : DiscreteControlSystem}
    {F : OptimalCostFunctional S} {V : ValueIteration S F}
    {D : DiscreteApproximationTheorem S F V} (B : OptimalControlBridge S F V D) where
  continuousOptimalControlClosed : B.continuousOptimalControl
  discreteOptimalControlClosed : B.discreteOptimalControl
  approximationRelationshipClosed : B.approximationRelationship

def OptimalControlBridgeClosed {S : DiscreteControlSystem}
    {F : OptimalCostFunctional S} {V : ValueIteration S F}
    {D : DiscreteApproximationTheorem S F V} (B : OptimalControlBridge S F V D) : Prop :=
  B.continuousOptimalControl ∧ B.discreteOptimalControl ∧ B.approximationRelationship

theorem optimal_control_bridge_closed_from_evidence {S : DiscreteControlSystem}
    {F : OptimalCostFunctional S} {V : ValueIteration S F}
    {D : DiscreteApproximationTheorem S F V} (B : OptimalControlBridge S F V D)
    (E : OptimalControlBridgeEvidence B) : OptimalControlBridgeClosed B := by
  exact And.intro E.continuousOptimalControlClosed
    (And.intro E.discreteOptimalControlClosed E.approximationRelationshipClosed)

end DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean
end HautevilleHouse
