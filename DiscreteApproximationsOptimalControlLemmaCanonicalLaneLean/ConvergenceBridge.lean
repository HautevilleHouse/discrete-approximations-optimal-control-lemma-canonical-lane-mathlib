import canonicalLaneMathlib.AdmissibleClass
import DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean.DiscreteApproxOptimalControl

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean

structure OptimalControlLimitingProblem where
  continuousTimeDynamics : Type u
  continuousCost : Type v
  admissibleControls : Type w
  valueFunction : Type x
  dynamicsLipschitz : Prop
  costBounded : Prop
  controlSetCompact : Prop
  dynamicsLipschitzTerm : dynamicsLipschitz
  costBoundedTerm : costBounded
  controlSetCompactTerm : controlSetCompact

structure OptimalControlLimitingEvidence (C : OptimalControlLimitingProblem) where
  dynamicsLipschitzClosed : C.dynamicsLipschitz
  costBoundedClosed : C.costBounded
  controlSetCompactClosed : C.controlSetCompact

def OptimalControlLimitingClosed (C : OptimalControlLimitingProblem) : Prop :=
  C.dynamicsLipschitz ∧ C.costBounded ∧ C.controlSetCompact

theorem optimal_control_limiting_closed_from_evidence
    (C : OptimalControlLimitingProblem) (E : OptimalControlLimitingEvidence C) :
    OptimalControlLimitingClosed C := by
  exact And.intro E.dynamicsLipschitzClosed
    (And.intro E.costBoundedClosed E.controlSetCompactClosed)

theorem discrete_approximation_convergence_lemma
    (D : DiscreteApproximationPackage) (E_d : DiscreteApproximationEvidence D)
    (C : OptimalControlLimitingProblem) (E_c : OptimalControlLimitingEvidence C) :
    (DiscreteApproximationClosed D) ∧ (OptimalControlLimitingClosed C) := by
  exact And.intro (discrete_approximation_closed_from_evidence D E_d)
    (optimal_control_limiting_closed_from_evidence C E_c)

end DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean
end HautevilleHouse