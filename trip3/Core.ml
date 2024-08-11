type location = string
type preference = Fastest | Cheapest | Simplest
type duration = Minutes of int

let preference_to_string p =
  match p with
  | Fastest -> "fastest"
  | Cheapest -> "cheapest"
  | Simplest -> "simplest"

let duration_to_string (Minutes m) = Printf.sprintf "%d mins" m

module type TripType = sig
  val vehicle_name : string
  val calculate : location -> location -> preference -> duration
end
