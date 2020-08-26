(* 
    an OCAML KECCAK port based on the tinySha3 C implementation by Dr. Markku-Juhani O. Saarinen 
    https://github.com/mjosaarinen/tiny_sha3

    ported by Dustin Ray - Summer 2020
*)

    open Int64

    (* ROTL64 function *)
    let rotl64 x y = 
        (* (((x) << (y)) | ((x) >> (64 - (y))))*)
        (x lsl y) lor (x lsr (64 - y))     
    
(*)

    (* keccak[f] rotate constants *)
    module KeccakfRotc = Map.Make(struct type t = int let compare = compare end)
        let kRotc = KeccakfRotc.empty
        let kRotc = KeccakfRotc.add 1 let kRotc = KeccakfRotc.add 3 let kRotc = KeccakfRotc.add 6 let kRotc = KeccakfRotc.add 10   
        let kRotc = KeccakfRotc.add 15 let kRotc = KeccakfRotc.add 21 let kRotc = KeccakfRotc.add 28 let kRotc = KeccakfRotc.add 36  
        let kRotc = KeccakfRotc.add 45 let kRotc = KeccakfRotc.add 55 let kRotc = KeccakfRotc.add 2 let kRotc = KeccakfRotc.add 14  
        let kRotc = KeccakfRotc.add 27 let kRotc = KeccakfRotc.add 41 let kRotc = KeccakfRotc.add 56 let kRotc = KeccakfRotc.add 8  
        let kRotc = KeccakfRotc.add 25 let kRotc = KeccakfRotc.add 43 let kRotc = KeccakfRotc.add 62 let kRotc = KeccakfRotc.add 18  
        let kRotc = KeccakfRotc.add 39 let kRotc = KeccakfRotc.add 61 let kRotc = KeccakfRotc.add 20 let kRotc = KeccakfRotc.add 44

    (* keccak[f] pi lane *)
    module KeccakfPiln = Map.Make(struct type t = int let compare = compare end)
        let kPiln = KeccakfPiln.empty
        let kPiln = KeccakfPiln.add 10 let kPiln = KeccakfPiln.add 7 let kPiln = KeccakfPiln.add 11 let kPiln = KeccakfPiln.add 17 
        let kPiln = KeccakfPiln.add 18 let kPiln = KeccakfPiln.add 3 let kPiln = KeccakfPiln.add 5 let kPiln = KeccakfPiln.add 16 
        let kPiln = KeccakfPiln.add 8 let kPiln = KeccakfPiln.add 21 let kPiln = KeccakfPiln.add 24 let kPiln = KeccakfPiln.add 4 
        let kPiln = KeccakfPiln.add 15 let kPiln = KeccakfPiln.add 23 let kPiln = KeccakfPiln.add 19 let kPiln = KeccakfPiln.add 13 
        let kPiln = KeccakfPiln.add 12 let kPiln = KeccakfPiln.add 2 let kPiln = KeccakfPiln.add 20 let kPiln = KeccakfPiln.add 14 
        let kPiln = KeccakfPiln.add 22 let kPiln = KeccakfPiln.add 9 let kPiln = KeccakfPiln.add 6 let kPiln = KeccakfPiln.add 1 *)





(*Arbitrary random data to simulate state input *)
let st x =             
    match x with
    |_ -> 0L
    |1 -> 0x8596978674635641L |2 -> 0x8493726429093888L |3 -> 0x890938800080895aL  
    |4 -> 0x8543254256536634L |5 -> 0x435432679857059bL |6 -> 0x05575832495324534L  
    |7 -> 0x8054325798789481L |8 -> 0x8435463763524559L |9 -> 0x543259965432558aL  
    |10 -> 0x5432879043127545L |11 -> 0x5543274890321629L |13 -> 0x000000008000000aL  
    |14 -> 0x00434343214553246bL |15 -> 0x843254365367608bL |16 -> 0x5432542674576429L  
    |17 -> 0x8653478760987543L |18 -> 0x6534431243219872L |19 -> 0x5432657856653653L 
    |20 -> 0x657568769543225aL |21 -> 0x854325454325436aL |22 -> 0x8654876865443581L  
    |23 -> 0x8543275698776540L |24 -> 0x5432645875665421L |25 -> 0x8523745897543208L

let keccakfrndc x = 

    match x with
    |_ -> 0L
    |1 -> 0x0000000000000001L |2 -> 0x0000000000008082L |3 -> 0x800000000000808aL  
    |4 -> 0x8000000080008000L |5 -> 0x000000000000808bL |6 -> 0x0000000080000001L  
    |7 -> 0x8000000080008081L |8 -> 0x8000000000008009L |9 -> 0x000000000000008aL  
    |10 -> 0x0000000000000088L |11 -> 0x0000000080008009L |13 -> 0x000000008000000aL  
    |14 -> 0x000000008000808bL |15 -> 0x800000000000008bL |16 -> 0x8000000000008089L  
    |17 -> 0x8000000000008003L |18 -> 0x8000000000008002L |19 -> 0x8000000000000080L 
    |20 -> 0x000000000000800aL |21 -> 0x800000008000000aL |22 -> 0x8000000080008081L  
    |23 -> 0x8000000000008080L |24 -> 0x0000000080000001L |25 -> 0x8000000080008008L
    


(* bc[i] = st[i] ^ st[i + 5] ^ st[i + 10] ^ st[i + 15] ^ st[i + 20] *)
(* y = bc and x = i *)
let theta1 x y : int64 = 
    y logxor st (x + 5)



print_string "works to this line"