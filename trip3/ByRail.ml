let vehicle_name = "train"

let calculate _from _to _pref =
  match _pref with
  | Core.Fastest -> Core.Minutes 100
  | Core.Cheapest -> Core.Minutes 120
  | Core.Simplest -> Core.Minutes 110
