(* Let's learn about lists in Ocaml. *)

(* Let's start out with a practice exercise on how we can 
create a function that finds out how many items are in a list
with pattern-matching. *)

(* Construct a function that pattern matches a 
list and returns the count as an integer.  *)

let rec count_list (lst : 'a list) : int = 
    match lst with
    | [] -> 0 
    | [_] -> 1
    | _ :: tl -> 1 + count_list tl ;;


(* Now that we've reviewed pattern-matching. Let's talk about 
List functions. How can we use List functions to accomplish count_list? *)

let lst = [1;2;3];;
let length = List.length lst ;;


(* How could we pattern match a list of numbers to double each one of them? *)
(* Construct a function that pattern matches an integer list and 
returns the integer list with each element doubled. *)

let rec double_list (lst : int list) : int list = 
    match lst with 
    | [] -> []
    | hd :: tl -> (hd * 2) :: double_list tl ;;


(* We can also use List.map to accomplish this effect. We can 
identify a function we want to apply to every item in our list and
map it onto each element. The syntax of map is: 
val map : ('a -> 'b) -> 'a list -> 'b list *)


(* Let's define the function we want to map on our elements. *)
let double x = x * 2 ;;

(* Now let's pass double as our input. *)
let doubled_list = List.map double lst ;;

(* Or more directly *)
let concise_double = List.map (fun x -> x * 2) lst ;;


(* Lastly, let's learn about List.filter. The syntax for filter is: 
val filter : ('a -> bool) -> 'a list -> 'a list *)

(* Let's try filtering out our odd numbers. We then want to construct a
function that only returns true is an element is even. *)
let identify_evens x = x mod 2 == 0 ;;

(* Now, let's pass in this indentification function as an input. *)
let filter_evens = List.filter identify_evens lst ;;