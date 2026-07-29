import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean

structure ConvergenceRate where
  order : ℕ
  constant : ℝ
  errorBound : ℕ → ℝ

def errorBoundExample (n : ℕ) : ℝ := 1.0 / ((n : ℝ) + 1)

structure ConvergenceEvidence (R : ConvergenceRate) where
  errorDecrease : ∀ n : ℕ, R.errorBound n ≤ R.constant * ((1 : ℝ) / ((n : ℝ) + 1)) ^ (R.order : ℕ)

def ConvergenceClosed (R : ConvergenceRate) : Prop :=
  R.order = 1 ∧ R.constant = 1.0

end DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean
end HautevilleHouse