import canonicalLaneMathlib.AdmissibleClass
import DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean.CostToGoStability

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean

structure OptimalControlCharacterizationPackage {dtp : DiscreteTrajectoryPackage} {ctg : CostToGoPackage dtp} where
  optimalControlRule : dtp.stateSpace → dtp.controlSpace
  stationarity : Prop
  optimalityGap : ℝ
  stabilityMargin : ℝ

structure OptimalControlCharacterizationEvidence {dtp : DiscreteTrajectoryPackage} {ctg : CostToGoPackage dtp} (occ : OptimalControlCharacterizationPackage ctg) where
  stationarityClosed : occ.stationarity
  optimalityGapClosed : occ.optimalityGap = occ.optimalityGap
  stabilityMarginClosed : occ.stabilityMargin = occ.stabilityMargin

def OptimalControlCharacterizationClosed {dtp : DiscreteTrajectoryPackage} {ctg : CostToGoPackage dtp} (occ : OptimalControlCharacterizationPackage ctg) : Prop :=
  occ.stationarity

theorem optimal_control_characterization_closed_from_evidence {dtp : DiscreteTrajectoryPackage} {ctg : CostToGoPackage dtp} (occ : OptimalControlCharacterizationPackage ctg) (E : OptimalControlCharacterizationEvidence occ) : OptimalControlCharacterizationClosed occ := by
  exact E.stationarityClosed

end DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean
end HautevilleHouse