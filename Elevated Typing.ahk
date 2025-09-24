#Requires AutoHotkey v2.0+

superscript := false
subscript := false

superscripts := Map(
    "0","⁰", "1","¹", "2","²", "3","³", "4","⁴", "5","⁵", "6","⁶", "7","⁷", "8","⁸", "9","⁹",
    "a","ᵃ", "b","ᵇ", "c","ᶜ", "d","ᵈ", "e","ᵉ", "f","ᶠ", "g","ᵍ", "h","ʰ", "i","ⁱ",
    "j","ʲ", "k","ᵏ", "l","ˡ", "m","ᵐ", "n","ⁿ", "o","ᵒ", "p","ᵖ", "r","ʳ",
    "s","ˢ", "t","ᵗ", "u","ᵘ", "v","ᵛ", "w","ʷ", "x","ˣ", "y","ʸ", "z","ᶻ",
    "A","ᴬ", "B","ᴮ", "D","ᴰ", "E","ᴱ", "G","ᴳ", "H","ᴴ", "I","ᴵ", "J","ᴶ", "K","ᴷ",
    "L","ᴸ", "M","ᴹ", "N","ᴺ", "O","ᴼ", "P","ᴾ", "R","ᴿ", "T","ᵀ", "U","ᵁ", "V","ⱽ", "W","ᵂ"
)
subscripts := Map(
    "0","₀", "1","₁", "2","₂", "3","₃", "4","₄", "5","₅", "6","₆", "7","₇", "8","₈", "9","₉",
    "a","ₐ", "e","ₑ", "h","ₕ", "i","ᵢ", "j","ⱼ", "k","ₖ", "l","ₗ", "m","ₘ", "n","ₙ", "o","ₒ",
    "p","ₚ", "r","ᵣ", "s","ₛ", "t","ₜ", "u","ᵤ", "v","ᵥ", "x","ₓ"
)

^#p:: {
    global superscript, subscript
    superscript := !superscript
    subscript := false
    ToolTip("Superscript: " superscript)
    SetTimer(RemoveToolTip, -1000)
}
^#b:: {
    global superscript, subscript
    subscript := !subscript
    superscript := false
    ToolTip("Subscript: " subscript)
    SetTimer(RemoveToolTip, -1000)
}

RemoveToolTip() {
    ToolTip()
}

#HotIf (superscript || subscript)
$1::superSubHandler()
$2::superSubHandler()
$3::superSubHandler()
$4::superSubHandler()
$5::superSubHandler()
$6::superSubHandler()
$7::superSubHandler()
$8::superSubHandler()
$9::superSubHandler()
$0::superSubHandler()
$a::superSubHandler()
$b::superSubHandler()
$c::superSubHandler()
$d::superSubHandler()
$e::superSubHandler()
$f::superSubHandler()
$g::superSubHandler()
$h::superSubHandler()
$i::superSubHandler()
$j::superSubHandler()
$k::superSubHandler()
$l::superSubHandler()
$m::superSubHandler()
$n::superSubHandler()
$o::superSubHandler()
$p::superSubHandler()
$q::superSubHandler()
$r::superSubHandler()
$s::superSubHandler()
$t::superSubHandler()
$u::superSubHandler()
$v::superSubHandler()
$w::superSubHandler()
$x::superSubHandler()
$y::superSubHandler()
$z::superSubHandler()
; No duplicates; only one definition per letter!

superSubHandler() {
    global superscript, subscript, superscripts, subscripts
    InputKey := SubStr(A_ThisHotkey, 2)
    ; Handle uppercase if shift is pressed
    if GetKeyState("Shift")
        InputKey := StrUpper(InputKey)
    ; Try superscript then subscript
    if superscript && superscripts.Has(InputKey)
        Send(superscripts[InputKey])
    else if subscript && subscripts.Has(InputKey)
        Send(subscripts[InputKey])
    else
        Send(InputKey)
}
#HotIf
