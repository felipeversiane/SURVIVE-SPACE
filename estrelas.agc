estrelas:
estrela=CreateImageColor(255,255,255,255)
for i=0 to 100
	
	CreateSprite(i+estrela,estrela)
	SetSpriteSize(i+estrela,2,2)
	SetSpritePosition(i+estrela,random(1,1100),random(1,621)) //// tamanho
	
	next i 
return 

moverestrelas:

for i=1 to 100 
	estrelay=GetSpriteY(estrela+i)+7 
	if estrelay>621
		estrelay=0
		endif
SetSpritePosition(i+estrela,GetSpriteX(i+estrela),estrelay)
next i 
return 
