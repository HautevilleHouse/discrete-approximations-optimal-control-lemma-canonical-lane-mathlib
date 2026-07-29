import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean

structure DiscreteDynamicsPackage where
  stateSpace : Type u
  controlSpace : Type v
  timeHorizon : Nat
  transition : stateSpace → controlSpace → stateSpace
  cost : stateSpace → controlSpace → ℝ
  initialCondition : stateSpace
  fixedFinalState : Bool
  finalCost : stateSpace → ℝ

def initialDynamics : DiscreteDynamicsPackage :=
  { stateSpace := Nat,
    controlSpace := Fin 2,
    timeHorizon := 10,
    transition := fun s c => if c.val = 0 then s else s + 1,
    cost := fun _ _ => 0,
    initialCondition := 0,
    fixedFinalState := false,
    finalCost := fun s => if s = 0 then 0 else 1 }

def DiscreteDynamicsClosed (D : DiscreteDynamicsPackage) : Prop :=
  D.timeHorizon > 0

end DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean
end HautevilleHouse