# ocaml-tripdemo

Demo of structuring modules based around trip calculation.

There are three executables `bin/main1.ml` and `main2.ml` and `main3.ml`. The
second and third use libraries in `trip2` and `trip3` directories.


# First version: main1

We have a top-level module `Trip` with sub-modules and a functor `TripPrinter`
that can take a particular type of trip (module of type `TripType`) and print
details of a calculated journey.

We define two types of trip (`ByRail` and `ByRoad`) and supply one of them to
our functor to produce a module that will print journey detials for us.

You wouldn't actually solve this simple a problem with this much machinery of
coursem but it shows how the parts might fit together.


# Changes for main2

Moving the module into its own file means we don't need the
`module <name> = struct ... end`. The module name will
automatically be based on the filename with the first letter
capitalised.

The directory-name we use for our library could be anything - "lib", "foo",
"my_trip_library" - the dune file in it determines the library name.

Apart from "unwrapping" the top-level module, the structure is the same


# Changes for main3

For library trip3 we split out modules into their own files.

If we want sub-modules to be visible to callers of our library we should
re-export them from the top-level module. If there is no file for the top-level
module dune will effectively create one exporting all the sub-modules.

Note that because we have modules named like `ByRoad` a file `byroad.ml` won't
be translated to the right name. It would instead give us `Byroad`. So - we
should name the file `ByRoad.ml` (which to my mind is more consistent anyway).

The type for `ByRoad` is defined in `ByRail.mli` and uses `include` to re-use
the type defined in `Core`.

Note that the module type `TripType` needs to be defined in a module - it is
not itself a module. Putting it in `Core` seems reasonable.

