(* 
    an OCAML KECCAK port based on the tinySha3 C implementation by Dr. Markku-Juhani O. Saarinen 
    https://github.com/mjosaarinen/tiny_sha3

    ported by Dustin Ray - Summer 2020
*)



let sha3_keccakf st = 

(* This would be a list or array in C/Java, a map here allows for accesing values easier. *)
(* keccak[f] round constants*)
let keccakf_rndc = [0, 0x0000000000000001L; 1, 0x0000000000008082L; 2, 0x800000000000808aL;
                    3, 0x8000000080008000L; 4, 0x000000000000808bL; 5, 0x0000000080000001L;
                    6, 0x8000000080008081L; 7, 0x8000000000008009L; 8, 0x000000000000008aL;
                    9, 0x0000000000000088L; 10, 0x0000000080008009L; 11, 0x000000008000000aL;
                    12, 0x000000008000808bL; 13, 0x800000000000008bL; 14, 0x8000000000008089L;
                    15, 0x8000000000008003L; 16, 0x8000000000008002L; 17, 0x8000000000000080L;
                    18, 0x000000000000800aL; 19, 0x800000008000000aL; 20, 0x8000000080008081L;
                    21, 0x8000000000008080L; 22, 0x0000000080000001L; 23, 0x8000000080008008L]


(* keccak[f] rotate constants *)
let keccakf_rotc = [1;  3;  6;  10; 
                    15; 21; 28; 36; 
                    45; 55; 2;  14;
                    27; 41; 56; 8;  
                    25; 43; 62; 18; 
                    39; 61; 20; 44]

(* keccak[f] pi lane *)
let keccakf_piln = [10, 7,  11, 17, 
                    18, 3, 5,  16, 
                    8,  21, 24, 4,
                    15, 23, 19, 13, 
                    12, 2, 20, 14, 
                    22, 9,  6,  1]


(* ROTL64 function as defined by KECCAK specs *)
let rotl64 x y = 
    (* (((x) << (y)) | ((x) >> (64 - (y))))*)
    (x lsl y) lor (x lsr (64 - y));

;