(* 
    an OCAML KECCAK port based on the tinySha3 C implementation by Dr. Markku-Juhani O. Saarinen 
    https://github.com/mjosaarinen/tiny_sha3

    ported by Dustin Ray - Summer 2020
*)




    (* Association list for indexing. *)
    (* keccak[f] round constants*)


    let keccakf_rndc : int64 list = 
        [0x0000000000000001L; 0x0000000000008082L; 0x800000000000808aL;
        0x8000000080008000L; 0x000000000000808bL; 0x0000000080000001L;
        0x8000000080008081L; 0x8000000000008009L; 0x000000000000008aL;
        0x0000000000000088L; 0x0000000080008009L; 0x000000008000000aL;
        0x000000008000808bL; 0x800000000000008bL; 0x8000000000008089L;
        0x8000000000008003L; 0x8000000000008002L; 0x8000000000000080L;
        0x000000000000800aL; 0x800000008000000aL; 0x8000000080008081L;
        0x8000000000008080L; 0x0000000080000001L; 0x8000000080008008L]

    (* keccak[f] rotate constants *)
    let keccakf_rotc : int list = 
        [1;  3;  6;  10; 
        15; 21; 28; 36; 
        45; 55; 2;  14;
        27; 41; 56; 8;  
        25; 43; 62; 18; 
        39; 61; 20; 44]

    (* keccak[f] pi lane *)
    let keccakf_piln : int list  = 
        [10; 7;  11; 17; 
        18; 3; 5;  16; 
        8;  21; 24; 4;
        15; 23; 19; 13; 
        12; 2; 20; 14; 
        22; 9;  6;  1]

    (* Recursion is preferred to for loops in functional paradigm *)



    (* ROTL64 function as defined by KECCAK specs *)
    let rotl64 x y = 
        (* (((x) << (y)) | ((x) >> (64 - (y))))*)
        (x lsl y) lor (x lsr (64 - y));

