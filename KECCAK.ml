(* an OCAML KECCAK port based on the tinySha3 C implementation by Dr. Markku-Juhani O. Saarinen 
    https://github.com/mjosaarinen/tiny_sha3

    ported by Dustin Ray - Summer 2020
*)
    



open Int64

(* Keccak[f] round constants as a function f(x) *)
let keccakfrndc x = 
    match x with
    |0 -> 0x0000000000000001L |1 -> 0x0000000000008082L |2 -> 0x800000000000808aL  
    |3 -> 0x8000000080008000L |4 -> 0x000000000000808bL |5 -> 0x0000000080000001L  
    |6 -> 0x8000000080008081L |7 -> 0x8000000000008009L |8 -> 0x000000000000008aL  
    |9 -> 0x0000000000000088L |10 -> 0x0000000080008009L |11 -> 0x000000008000000aL  
    |13 -> 0x000000008000808bL |14 -> 0x800000000000008bL |15 -> 0x8000000000008089L  
    |16 -> 0x8000000000008003L |17 -> 0x8000000000008002L |18 -> 0x8000000000000080L 
    |19 -> 0x000000000000800aL |20 -> 0x800000008000000aL |21 -> 0x8000000080008081L  
    |22 -> 0x8000000000008080L |23 -> 0x0000000080000001L |24 -> 0x8000000080008008L
    | _ -> 0L


(*Arbitrary random data to simulate state input *)
let st x =             
    match x with
    |0 -> 0L
    |1 -> 0x8596978674635641L |2 -> 0x8493726429093888L |3 -> 0x890938800080895aL  
    |4 -> 0x8543254256536634L |5 -> 0x435432679857059bL |6 -> 0x05575832495324534L  
    |7 -> 0x8054325798789481L |8 -> 0x8435463763524559L |9 -> 0x543259965432558aL  
    |10 -> 0x5432879043127545L |11 -> 0x5543274890321629L |12 -> 0x000000008000000aL  
    |13 -> 0x00434343214553246bL |14 -> 0x843254365367608bL |15 -> 0x5432542674576429L  
    |16 -> 0x8653478760987543L |17 -> 0x6534431243219872L |18 -> 0x5432657856653653L 
    |19 -> 0x657568769543225aL |20 -> 0x854325454325436aL |21 -> 0x8654876865443581L  
    |22 -> 0x8543275698776540L |23 -> 0x5432645875665421L |24 -> 0x8523745897543208L
    | _ -> 0L


(* ROTL64 function *)
let rotl64 x y = 
    (* (((x) << (y)) | ((x) >> (64 - (y))))*)
    (x lsl y) lor (x lsr (64 - y))     
    
(* bc[i] = st[i] ^ st[i + 5] ^ st[i + 10] ^ st[i + 15] ^ st[i + 20] *)
(* y = st[i] and x = i *)
let theta1 (x: int) y : int64 = 
    y logxor st (x + (x * 5));;

(* figure out how to call this function *)


print_string "works to this line\n"