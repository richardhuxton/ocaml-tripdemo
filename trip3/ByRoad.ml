let vehicle_name = "car"

let calculate _from _to _pref =
  match _pref with
  | Core.Fastest -> Core.Minutes 200
  | Core.Cheapest -> Core.Minutes 220
  | Core.Simplest -> Core.Minutes 210
