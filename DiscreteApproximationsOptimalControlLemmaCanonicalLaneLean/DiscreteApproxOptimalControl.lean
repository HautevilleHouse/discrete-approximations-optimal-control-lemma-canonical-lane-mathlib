import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean

structure DiscreteApproximationPackage where
  timeStep : Type u
  stateSpace : Type v
  controlSpace : Type w
  dynamics : Type x
  costFunctional : Type y
  stepSizeUniform : Prop
  stateSpaceMetric : Prop
  controlSpaceCompact : Prop
  dynamicsContinuous : Prop
  costContinuous : Prop
  stepSizeUniformTerm : stepSizeUniform
  stateSpaceMetricTerm : stateSpaceMetric
  controlSpaceCompactTerm : controlSpaceCompact
  dynamicsContinuousTerm : dynamicsContinuous
  costContinuousTerm : costContinuous

structure DiscreteApproximationEvidence (D : DiscreteApproximationPackage) where
  stepSizeUniformClosed : D.stepSizeUniform
  stateSpaceMetricClosed : D.stateSpaceMetric
  controlSpaceCompactClosed : D.controlSpaceCompact
  dynamicsContinuousClosed : D.dynamicsContinuous
  costContinuousClosed : D.costContinuous

def DiscreteApproximationClosed (D : DiscreteApproximationPackage) : Prop :=
  D.stepSizeUniform ∧ D.stateSpaceMetric ∧ D.controlSpaceCompact ∧ D.dynamicsContinuous ∧ D.costContinuous

theorem discrete_approximation_closed_from_evidence
    (D : DiscreteApproximationPackage) (E : DiscreteApproximationEvidence D) :
    DiscreteApproximationClosed D := by
  exact And.intro E.stepSizeUniformClosed
    (And.intro E.stateSpaceMetricClosed
      (And.intro E.controlSpaceCompactClosed
        (And.intro E.dynamicsContinuousClosed E.costContinuousClosed)))

end DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean
end HautevilleHouse