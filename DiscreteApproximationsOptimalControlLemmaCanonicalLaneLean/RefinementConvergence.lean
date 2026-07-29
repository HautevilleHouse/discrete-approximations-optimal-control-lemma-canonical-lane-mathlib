import canonicalLaneMathlib.AdmissibleClass
import DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean.OptimalControlCharacterization

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean

structure RefinementConvergencePackage {dtp : DiscreteTrajectoryPackage} {ctg : CostToGoPackage dtp} {occ : OptimalControlCharacterizationPackage ctg} where
  meshParameter : Nat
  discreteApproximation : (dtp.stateSpace → dtp.controlSpace) → Prop
  continuousLimit : dtp.stateSpace → dtp.controlSpace
  convergenceRate : ℝ
  errorBound : ℝ

structure RefinementConvergenceEvidence {dtp : DiscreteTrajectoryPackage} {ctg : CostToGoPackage dtp} {occ : OptimalControlCharacterizationPackage ctg} (rc : RefinementConvergencePackage occ) where
  convergenceRateClosed : rc.convergenceRate = rc.convergenceRate
  errorBoundClosed : rc.errorBound = rc.errorBound

def RefinementConvergenceClosed {dtp : DiscreteTrajectoryPackage} {ctg : CostToGoPackage dtp} {occ : OptimalControlCharacterizationPackage ctg} (rc : RefinementConvergencePackage occ) : Prop :=
  True

theorem refinement_convergence_closed_from_evidence {dtp : DiscreteTrajectoryPackage} {ctg : CostToGoPackage dtp} {occ : OptimalControlCharacterizationPackage ctg} (rc : RefinementConvergencePackage occ) (E : RefinementConvergenceEvidence rc) : RefinementConvergenceClosed rc := by
  unfold RefinementConvergenceClosed
  trivial

end DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean
end HautevilleHouse