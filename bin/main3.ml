let () =
  let journey_prefs = Trip3.Core.[ Fastest; Cheapest; Simplest ] in
  let module T = Trip3.TripPrinter (Trip3.ByRoad) in
  List.iter (T.calc_and_print_journey "London" "Paris") journey_prefs
