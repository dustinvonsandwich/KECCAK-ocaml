(* 
    an OCAML KECCAK port based on the tinySha3 C implementation by Dr. Markku-Juhani O. Saarinen 
    https://github.com/mjosaarinen/tiny_sha3
*)








(* ROTL64 function as defined by KECCAK specs *)
let rotl64 x y = 
    (* (((x) << (y)) | ((x) >> (64 - (y))))*)
    (x lsl y) lor (x lsr (64 - y))

