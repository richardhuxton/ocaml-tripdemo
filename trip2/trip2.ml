module Core = struct
  type location = string
  type preference = Fastest | Cheapest | Simplest
  type duration = Minutes of int

  let preference_to_string p =
    match p with
    | Fastest -> "fastest"
    | Cheapest -> "cheapest"
    | Simplest -> "simplest"

  let duration_to_string (Minutes m) = Printf.sprintf "%d mins" m
end

module type TripType = sig
  val vehicle_name : string

  val calculate :
    Core.location -> Core.location -> Core.preference -> Core.duration
end

module ByRail : TripType = struct
  let vehicle_name = "train"

  let calculate _from _to _pref =
    match _pref with
    | Core.Fastest -> Core.Minutes 100
    | Core.Cheapest -> Core.Minutes 120
    | Core.Simplest -> Core.Minutes 110
end

module ByRoad : TripType = struct
  let vehicle_name = "car"

  let calculate _from _to _pref =
    match _pref with
    | Core.Fastest -> Core.Minutes 200
    | Core.Cheapest -> Core.Minutes 220
    | Core.Simplest -> Core.Minutes 210
end

(* TripPrinter is a functor that takes a module of type TripType and returns a module that will print trips for you *)
module TripPrinter (TripMethod : TripType) = struct
  let calc_and_print_journey from_locn to_locn pref =
    let trip_length = TripMethod.calculate from_locn to_locn pref in
    Printf.printf "By %s from %s to %s (%s) duration = %s\n"
      TripMethod.vehicle_name from_locn to_locn
      (Core.preference_to_string pref)
      (Core.duration_to_string trip_length)
end

