# =================RANDOM QUOTES ==================
#fortune echoed into an animal blob

num_quotes=45
rand=$[ ( $RANDOM % $num_quotes ) + 1 ]
 
case $rand in
	1)animal="vis.zen";;
	2)animal="bong";;
	3)animal="bud-frogs";;
	4)animal="bunny";;
	5)animal="cheese";;
	6)animal="cower";;
	7)animal="daemon";;
	8)animal="default";;
	9)animal="dragon";;
	10)animal="dragon-and-cow";;
	11)animal="elephant";;
	12)animal="elephant-in-snake";;
	13)animal="eyes";;
	14)animal="flaming-sheep";;
	15)animal="ghostbusters";;
	16)animal="head-in";;
	17)animal="hellokitty";;
	18)animal="kiss";;
	19)animal="kitty";;
	20)animal="koala";;
	21)animal="kosh";;
	22)animal="luke-koala";;
	23)animal="meow";;
	24)animal="milk";;
	25)animal="moofasa";;
	26)animal="moose";;
	27)animal="mutilated";;
	28)animal="ren";;
	29)animal="satanic";;
	30)animal="sheep";;
	31)animal="skeleton";;
	32)animal="small";;
	33)animal="sodomized";;
	34)animal="stegosaurus";;
	35)animal="stimpy";;
	36)animal="supermilker";;
	37)animal="surgery";;
	38)animal="telebears";;
	39)animal="three-eyes";;
	40)animal="turkey";;
	41)animal="turtle";;
	42)animal="tux";;
	43)animal="udder";;
	44)animal="vader";;
	45)animal="vader-koala";;
esac


fortune | cowsay -f $animal
echo " "
