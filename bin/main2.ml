let () =
  let journey_prefs = Trip2.Core.[ Fastest; Cheapest; Simplest ] in
  let module T = Trip2.TripPrinter (Trip2.ByRoad) in
  List.iter (T.calc_and_print_journey "London" "Paris") journey_prefs
