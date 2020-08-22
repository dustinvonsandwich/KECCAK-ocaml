(* 
    an OCAML KECCAK port based on the tinySha3 C implementation by Dr. Markku-Juhani O. Saarinen 
    https://github.com/mjosaarinen/tiny_sha3
*)



let ROTL64 x y = 
    (((x) << (y)) | ((x) >> (64 - (y))))

