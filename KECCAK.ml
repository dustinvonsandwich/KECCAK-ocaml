(* 
    an OCAML KECCAK port based on the tinySha3 C implementation by Dr. Markku-Juhani O. Saarinen 
    https://github.com/mjosaarinen/tiny_sha3

    ported by Dustin Ray - Summer 2020
*)


    (* ROTL64 function *)
    let rotl64 x y = 
        (* (((x) << (y)) | ((x) >> (64 - (y))))*)
        (x lsl y) lor (x lsr (64 - y)) 

    (* A note on the difference between the data structure below and a typical imperative structure as we have implemented in
    Java and Rust: You may see that we are creating a new map every time we add something to KeccakfRndc, and this is in fact what is happening.
    You may also note that this process would consume a much larger amount of memory compared to an array or a list in an imperative setting, however
    Ocaml has automatic memory management that allows us to work in this fashion with resource usage comparable to an imperative language.  *)
    (* keccak[f] round constants as map*)
    module KeccakfRndc = Map.Make(struct type t = int64 let compare = compare end)
        let kRndc = KeccakfRndc.empty
        let kRndc = KeccakfRndc.add 0x0000000000000001L let kRndc = KeccakfRndc.add 0x0000000000008082L let kRndc = KeccakfRndc.add 0x800000000000808aL  
        let kRndc = KeccakfRndc.add 0x8000000080008000L let kRndc = KeccakfRndc.add 0x000000000000808bL let kRndc = KeccakfRndc.add 0x0000000080000001L  
        let kRndc = KeccakfRndc.add 0x8000000080008081L let kRndc = KeccakfRndc.add 0x8000000000008009L let kRndc = KeccakfRndc.add 0x000000000000008aL  
        let kRndc = KeccakfRndc.add 0x0000000000000088L let kRndc = KeccakfRndc.add 0x0000000080008009L let kRndc = KeccakfRndc.add 0x000000008000000aL  
        let kRndc = KeccakfRndc.add 0x000000008000808bL let kRndc = KeccakfRndc.add 0x800000000000008bL let kRndc = KeccakfRndc.add 0x8000000000008089L  
        let kRndc = KeccakfRndc.add 0x8000000000008003L let kRndc = KeccakfRndc.add 0x8000000000008002L let kRndc = KeccakfRndc.add 0x8000000000000080L 
        let kRndc = KeccakfRndc.add 0x000000000000800aL let kRndc = KeccakfRndc.add 0x800000008000000aL let kRndc = KeccakfRndc.add 0x8000000080008081L  
        let kRndc = KeccakfRndc.add 0x8000000000008080L let kRndc = KeccakfRndc.add 0x0000000080000001L let kRndc = KeccakfRndc.add 0x8000000080008008L
    
    


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
        let kPiln = KeccakfPiln.add 22 let kPiln = KeccakfPiln.add 9 let kPiln = KeccakfPiln.add 6 let kPiln = KeccakfPiln.add 1


    (*Main permutation. Give me st, Ill give you st back with keccak machinery applied. *)
    let rec keccakfpermuation = (fun x -> x)

        
        


        let t = 0

        module Bc = Map.Make(struct type t = int64 let compare = compare end)

        


        
    

        
        
