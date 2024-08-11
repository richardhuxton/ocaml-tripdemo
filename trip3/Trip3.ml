module Core = Core
module ByRoad = ByRoad
module ByRail = ByRail

(* TripPrinter is a functor that takes a module of type TripType and returns a module that will print trips for you *)
module TripPrinter (TripMethod : Core.TripType) = struct
  let calc_and_print_journey from_locn to_locn pref =
    let trip_length = TripMethod.calculate from_locn to_locn pref in
    Printf.printf "By %s from %s to %s (%s) duration = %s\n"
      TripMethod.vehicle_name from_locn to_locn
      (Core.preference_to_string pref)
      (Core.duration_to_string trip_length)
end
