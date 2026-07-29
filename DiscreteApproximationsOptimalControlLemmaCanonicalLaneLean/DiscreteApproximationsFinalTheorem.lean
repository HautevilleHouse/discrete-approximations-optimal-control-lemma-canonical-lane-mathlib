import DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean.DiscreteApproximationsGateLemmas

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean

def ConstrainedDiscreteApproximationsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_discrete_approximations_endgame (A : AdmissibleClass) :
    ConstrainedDiscreteApproximationsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean
end HautevilleHouse
