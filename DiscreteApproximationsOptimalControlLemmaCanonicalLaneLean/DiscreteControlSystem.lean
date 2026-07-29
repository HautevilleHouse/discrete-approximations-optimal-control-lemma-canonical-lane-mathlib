import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean

structure DiscreteControlSystem where
  stateSpace : Type u
  controlSpace : Type v
  dynamics : stateSpace → controlSpace → stateSpace
  timeHorizon : Nat
  initialCondition : stateSpace
  discreteDynamics : Prop
  finiteControlSet : Prop
  deterministicTransition : Prop
  discreteDynamicsTerm : discreteDynamics
  finiteControlSetTerm : finiteControlSet
  deterministicTransitionTerm : deterministicTransition

structure DiscreteControlSystemEvidence (S : DiscreteControlSystem) where
  discreteDynamicsClosed : S.discreteDynamics
  finiteControlSetClosed : S.finiteControlSet
  deterministicTransitionClosed : S.deterministicTransition

def DiscreteControlSystemClosed (S : DiscreteControlSystem) : Prop :=
  S.discreteDynamics ∧ S.finiteControlSet ∧ S.deterministicTransition

theorem discrete_control_system_closed_from_evidence (S : DiscreteControlSystem)
    (E : DiscreteControlSystemEvidence S) : DiscreteControlSystemClosed S := by
  exact And.intro E.discreteDynamicsClosed (And.intro E.finiteControlSetClosed E.deterministicTransitionClosed)

end DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean
end HautevilleHouse
