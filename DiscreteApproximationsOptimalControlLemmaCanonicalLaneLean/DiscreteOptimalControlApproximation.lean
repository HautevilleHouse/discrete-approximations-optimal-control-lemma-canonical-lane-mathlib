import DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean.DiscreteApproximationsFinalTheorem

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean

structure DiscreteControlSystem where
  stateSpace : Type u
  controlSpace : Type v
  dynamics : stateSpace → controlSpace → stateSpace
  cost : stateSpace → controlSpace → ℝ
  horizon : ℕ

structure DiscreteApproximation where
  dt : ℝ
  discreteStates : List (ℕ → ℝ)
  discreteControls : List (ℕ → ℝ)
  consistencyError : Prop
  convergenceRate : ℕ → ℝ
  errorBound : ℝ

def ApproximationErrorBound (approx : DiscreteApproximation) : ℝ := approx.errorBound

theorem consistency_implies_convergence (approx : DiscreteApproximation) :
    approx.consistencyError → (∀ n, approx.convergenceRate n ≤ approx.errorBound) := by
  intro hCons
  intro n
  sorry

end DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean
end HautevilleHouse
