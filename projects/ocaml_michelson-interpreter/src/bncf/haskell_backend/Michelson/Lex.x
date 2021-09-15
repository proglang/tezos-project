-- -*- haskell -*-
-- This Alex file was machine-generated by the BNF converter
{
{-# OPTIONS -fno-warn-incomplete-patterns #-}
{-# OPTIONS_GHC -w #-}

{-# LANGUAGE PatternSynonyms #-}

module Michelson.Lex where

import Prelude

import qualified Data.Bits
import Data.Char     (ord)
import Data.Function (on)
import Data.Word     (Word8)
}

-- Predefined character classes

$c = [A-Z\192-\221] # [\215]  -- capital isolatin1 letter (215 = \times) FIXME
$s = [a-z\222-\255] # [\247]  -- small   isolatin1 letter (247 = \div  ) FIXME
$l = [$c $s]         -- letter
$d = [0-9]           -- digit
$i = [$l $d _ ']     -- identifier character
$u = [. \n]          -- universal: any character

-- Symbols and non-identifier-like reserved words

@rsyms = \; | \{ | \}

:-

-- Line comment "#"
"#" [.]* ;

-- Whitespace (skipped)
$white+ ;

-- Symbols
@rsyms
    { tok (eitherResIdent TV) }

-- token Int
\- ? $d +
    { tok (eitherResIdent T_Int) }

-- token Nat
$d +
    { tok (eitherResIdent T_Nat) }

-- token Str
\" ([$u # [\" \\]] | \\ [\" \\ b n r t]) * \"
    { tok (eitherResIdent T_Str) }

-- token Hex
0 x ([A B C D E F a b c d e f]| $d)+
    { tok (eitherResIdent T_Hex) }

-- Keywords and Ident
$l $i*
    { tok (eitherResIdent TV) }

{
-- | Create a token with position.
tok :: (String -> Tok) -> (Posn -> String -> Token)
tok f p = PT p . f

-- | Token without position.
data Tok
  = TK {-# UNPACK #-} !TokSymbol  -- ^ Reserved word or symbol.
  | TL !String                    -- ^ String literal.
  | TI !String                    -- ^ Integer literal.
  | TV !String                    -- ^ Identifier.
  | TD !String                    -- ^ Float literal.
  | TC !String                    -- ^ Character literal.
  | T_Int !String
  | T_Nat !String
  | T_Str !String
  | T_Hex !String
  deriving (Eq, Show, Ord)

-- | Smart constructor for 'Tok' for the sake of backwards compatibility.
pattern TS :: String -> Int -> Tok
pattern TS t i = TK (TokSymbol t i)

-- | Keyword or symbol tokens have a unique ID.
data TokSymbol = TokSymbol
  { tsText :: String
      -- ^ Keyword or symbol text.
  , tsID   :: !Int
      -- ^ Unique ID.
  } deriving (Show)

-- | Keyword/symbol equality is determined by the unique ID.
instance Eq  TokSymbol where (==)    = (==)    `on` tsID

-- | Keyword/symbol ordering is determined by the unique ID.
instance Ord TokSymbol where compare = compare `on` tsID

-- | Token with position.
data Token
  = PT  Posn Tok
  | Err Posn
  deriving (Eq, Show, Ord)

-- | Pretty print a position.
printPosn :: Posn -> String
printPosn (Pn _ l c) = "line " ++ show l ++ ", column " ++ show c

-- | Pretty print the position of the first token in the list.
tokenPos :: [Token] -> String
tokenPos (t:_) = printPosn (tokenPosn t)
tokenPos []    = "end of file"

-- | Get the position of a token.
tokenPosn :: Token -> Posn
tokenPosn (PT p _) = p
tokenPosn (Err p)  = p

-- | Get line and column of a token.
tokenLineCol :: Token -> (Int, Int)
tokenLineCol = posLineCol . tokenPosn

-- | Get line and column of a position.
posLineCol :: Posn -> (Int, Int)
posLineCol (Pn _ l c) = (l,c)

-- | Convert a token into "position token" form.
mkPosToken :: Token -> ((Int, Int), String)
mkPosToken t = (tokenLineCol t, tokenText t)

-- | Convert a token to its text.
tokenText :: Token -> String
tokenText t = case t of
  PT _ (TS s _) -> s
  PT _ (TL s)   -> show s
  PT _ (TI s)   -> s
  PT _ (TV s)   -> s
  PT _ (TD s)   -> s
  PT _ (TC s)   -> s
  Err _         -> "#error"
  PT _ (T_Int s) -> s
  PT _ (T_Nat s) -> s
  PT _ (T_Str s) -> s
  PT _ (T_Hex s) -> s

-- | Convert a token to a string.
prToken :: Token -> String
prToken t = tokenText t

-- | Finite map from text to token organized as binary search tree.
data BTree
  = N -- ^ Nil (leaf).
  | B String Tok BTree BTree
      -- ^ Binary node.
  deriving (Show)

-- | Convert potential keyword into token or use fallback conversion.
eitherResIdent :: (String -> Tok) -> String -> Tok
eitherResIdent tv s = treeFind resWords
  where
  treeFind N = tv s
  treeFind (B a t left right) =
    case compare s a of
      LT -> treeFind left
      GT -> treeFind right
      EQ -> t

-- | The keywords and symbols of the language organized as binary search tree.
resWords :: BTree
resWords =
  b "PACK" 71
    (b "GT" 36
       (b "CONTRACT" 18
          (b "BLAKE2B" 9
             (b "AMOUNT" 5
                (b "ADD" 3 (b "ABS" 2 (b ";" 1 N N) N) (b "ADDRESS" 4 N N))
                (b "APPLY" 7 (b "AND" 6 N N) (b "BALANCE" 8 N N)))
             (b "CHECK_SIGNATURE" 14
                (b "CDR" 12 (b "CAST" 11 (b "CAR" 10 N N) N) (b "CHAIN_ID" 13 N N))
                (b "CONCAT" 16 (b "COMPARE" 15 N N) (b "CONS" 17 N N))))
          (b "EMPTY_MAP" 27
             (b "DUG" 23
                (b "DIP" 21
                   (b "DIG" 20 (b "CREATE_CONTRACT" 19 N N) N) (b "DROP" 22 N N))
                (b "EDIV" 25 (b "DUP" 24 N N) (b "EMPTY_BIG_MAP" 26 N N)))
             (b "FAILWITH" 32
                (b "EXEC" 30 (b "EQ" 29 (b "EMPTY_SET" 28 N N) N) (b "Elt" 31 N N))
                (b "GE" 34 (b "False" 33 N N) (b "GET" 35 N N)))))
       (b "LSL" 54
          (b "ITER" 45
             (b "IF_NONE" 41
                (b "IF_CONS" 39
                   (b "IF" 38 (b "HASH_KEY" 37 N N) N) (b "IF_LEFT" 40 N N))
                (b "INT" 43 (b "IMPLICIT_ACCOUNT" 42 N N) (b "ISNAT" 44 N N)))
             (b "LEFT" 50
                (b "LAMBDA" 48
                   (b "KECCAK" 47 (b "JOIN_TICKETS" 46 N N) N) (b "LE" 49 N N))
                (b "LOOP" 52 (b "LEVEL" 51 N N) (b "LOOP_LEFT" 53 N N))))
          (b "NEVER" 63
             (b "MEM" 59
                (b "Left" 57 (b "LT" 56 (b "LSR" 55 N N) N) (b "MAP" 58 N N))
                (b "NEG" 61 (b "MUL" 60 N N) (b "NEQ" 62 N N)))
             (b "NOW" 67
                (b "NONE" 65 (b "NIL" 64 N N) (b "NOT" 66 N N))
                (b "OPEN_CHEST" 69 (b "None" 68 N N) (b "OR" 70 N N))))))
    (b "XOR" 107
       (b "SIZE" 89
          (b "SAPLING_EMPTY_STATE" 80
             (b "READ_TICKET" 76
                (b "PUSH" 74
                   (b "PAIRING_CHECK" 73 (b "PAIR" 72 N N) N) (b "Pair" 75 N N))
                (b "RIGHT" 78 (b "RENAME" 77 N N) (b "Right" 79 N N)))
             (b "SET_DELEGATE" 85
                (b "SELF_ADDRESS" 83
                   (b "SELF" 82 (b "SAPLING_VERIFY_UPDATE" 81 N N) N)
                   (b "SENDER" 84 N N))
                (b "SHA3" 87 (b "SHA256" 86 N N) (b "SHA512" 88 N N))))
          (b "TOTAL_VOTING_POWER" 98
             (b "SUB" 94
                (b "SOURCE" 92
                   (b "SOME" 91 (b "SLICE" 90 N N) N) (b "SPLIT_TICKET" 93 N N))
                (b "Some" 96 (b "SWAP" 95 N N) (b "TICKET" 97 N N)))
             (b "UNPAIR" 103
                (b "UNIT" 101
                   (b "True" 100 (b "TRANSFER_TOKENS" 99 N N) N) (b "UNPACK" 102 N N))
                (b "Unit" 105 (b "UPDATE" 104 N N) (b "VOTING_POWER" 106 N N)))))
       (b "mutez" 125
          (b "chest" 116
             (b "bls12_381_g2" 112
                (b "bls12_381_fr" 110
                   (b "big_map" 109 (b "address" 108 N N) N)
                   (b "bls12_381_g1" 111 N N))
                (b "bytes" 114 (b "bool" 113 N N) (b "chain_id" 115 N N)))
             (b "key_hash" 121
                (b "int" 119
                   (b "contract" 118 (b "chest_key" 117 N N) N) (b "key" 120 N N))
                (b "list" 123 (b "lambda" 122 N N) (b "map" 124 N N))))
          (b "set" 134
             (b "or" 130
                (b "operation" 128
                   (b "never" 127 (b "nat" 126 N N) N) (b "option" 129 N N))
                (b "sapling_state" 132
                   (b "pair" 131 N N) (b "sapling_transaction" 133 N N)))
             (b "timestamp" 138
                (b "string" 136 (b "signature" 135 N N) (b "ticket" 137 N N))
                (b "{" 140 (b "unit" 139 N N) (b "}" 141 N N))))))
  where
  b s n = B bs (TS bs n)
    where
    bs = s

-- | Unquote string literal.
unescapeInitTail :: String -> String
unescapeInitTail = id . unesc . tail . id
  where
  unesc s = case s of
    '\\':c:cs | elem c ['\"', '\\', '\''] -> c : unesc cs
    '\\':'n':cs  -> '\n' : unesc cs
    '\\':'t':cs  -> '\t' : unesc cs
    '\\':'r':cs  -> '\r' : unesc cs
    '\\':'f':cs  -> '\f' : unesc cs
    '"':[]       -> []
    c:cs         -> c : unesc cs
    _            -> []

-------------------------------------------------------------------
-- Alex wrapper code.
-- A modified "posn" wrapper.
-------------------------------------------------------------------

data Posn = Pn !Int !Int !Int
  deriving (Eq, Show, Ord)

alexStartPos :: Posn
alexStartPos = Pn 0 1 1

alexMove :: Posn -> Char -> Posn
alexMove (Pn a l c) '\t' = Pn (a+1)  l     (((c+7) `div` 8)*8+1)
alexMove (Pn a l c) '\n' = Pn (a+1) (l+1)   1
alexMove (Pn a l c) _    = Pn (a+1)  l     (c+1)

type Byte = Word8

type AlexInput = (Posn,     -- current position,
                  Char,     -- previous char
                  [Byte],   -- pending bytes on the current char
                  String)   -- current input string

tokens :: String -> [Token]
tokens str = go (alexStartPos, '\n', [], str)
    where
      go :: AlexInput -> [Token]
      go inp@(pos, _, _, str) =
               case alexScan inp 0 of
                AlexEOF                   -> []
                AlexError (pos, _, _, _)  -> [Err pos]
                AlexSkip  inp' len        -> go inp'
                AlexToken inp' len act    -> act pos (take len str) : (go inp')

alexGetByte :: AlexInput -> Maybe (Byte,AlexInput)
alexGetByte (p, c, (b:bs), s) = Just (b, (p, c, bs, s))
alexGetByte (p, _, [], s) =
  case s of
    []  -> Nothing
    (c:s) ->
             let p'     = alexMove p c
                 (b:bs) = utf8Encode c
              in p' `seq` Just (b, (p', c, bs, s))

alexInputPrevChar :: AlexInput -> Char
alexInputPrevChar (p, c, bs, s) = c

-- | Encode a Haskell String to a list of Word8 values, in UTF8 format.
utf8Encode :: Char -> [Word8]
utf8Encode = map fromIntegral . go . ord
  where
  go oc
   | oc <= 0x7f       = [oc]

   | oc <= 0x7ff      = [ 0xc0 + (oc `Data.Bits.shiftR` 6)
                        , 0x80 + oc Data.Bits..&. 0x3f
                        ]

   | oc <= 0xffff     = [ 0xe0 + (oc `Data.Bits.shiftR` 12)
                        , 0x80 + ((oc `Data.Bits.shiftR` 6) Data.Bits..&. 0x3f)
                        , 0x80 + oc Data.Bits..&. 0x3f
                        ]
   | otherwise        = [ 0xf0 + (oc `Data.Bits.shiftR` 18)
                        , 0x80 + ((oc `Data.Bits.shiftR` 12) Data.Bits..&. 0x3f)
                        , 0x80 + ((oc `Data.Bits.shiftR` 6) Data.Bits..&. 0x3f)
                        , 0x80 + oc Data.Bits..&. 0x3f
                        ]
}
