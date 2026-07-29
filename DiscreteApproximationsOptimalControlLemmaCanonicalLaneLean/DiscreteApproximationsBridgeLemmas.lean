import DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean.DiscreteApproximationsAdmissibleClass

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  DiscreteWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DiscreteApproximationsOptimalControlLemmaCanonicalLaneLean
end HautevilleHouse
