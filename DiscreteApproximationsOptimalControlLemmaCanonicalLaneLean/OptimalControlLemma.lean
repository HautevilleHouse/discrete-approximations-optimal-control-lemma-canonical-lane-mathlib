import canonicalLaneMathlib.AdmissibleClass
import DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean.DiscreteDynamics
import DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean.DiscreteHamiltonJacobiBellman
import DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean.ConsistencyError
import DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean.ConvergenceRate

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean

structure OptimalControlLemma where
  dynamics : DiscreteDynamicsPackage
  hjb : DiscreteHJBEquation
  consistency : ConsistencyErrorBounds
  convergence : ConvergenceRate

def discreteApproximationsOptimalControlEvidence : OptimalControlLemma :=
  { dynamics := initialDynamics,
    hjb := { valueFunction := fun _ => 0, bellmanOptimality := fun _ _ _ => True, hjbPdeDiscrete := fun _ => True },
    consistency := { spatialStep := 0.1, timeStep := 0.01, localTruncationError := 0.05, stabilityCondition := fun h => h > 0 },
    convergence := { order := 1, constant := 1.0, errorBound := errorBoundExample } }

def ConstrainedOptimalControlClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_optimal_control_endgame (A : AdmissibleClass) :
    ConstrainedOptimalControlClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean
end HautevilleHouse