
// Project: SURVIVE IN SPACE 
// Created: 2022-05-05

// show all errors
SetErrorMode(2)

// set window properties
SetWindowTitle( "SURVIVE IN SPACE" )
SetWindowSize( 1104, 621, 1 )
SetWindowAllowResize( 1 ) // allow the user to resize the window

// set display properties
SetVirtualResolution( 1104, 621 ) // doesn't have to match the window
SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
SetSyncRate( 60, 0 ) // 30fps instead of 60 to save battery
SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
//UseNewDefaultFonts( 1 ) // since version 2.0.22 we can use nicer default fonts
fundo=CreateSprite(LoadImage("FUNDO.png"))
///////////////////////////////////////////////
nave=CreateSprite(LoadImage("NAVE.png"))
SetSpriteSize(nave,300,300)
SetSpriteShape(nave,3)
/////////////////////////////////////////////////
inimigo1=CreateSprite(LoadImage("INIMIGO 1.png"))
SetSpriteSize(inimigo1,150,150)
SetSpritePosition(inimigo1,0,0)
SetSpriteShape(inimigo1,3)
inimigo2=CreateSprite(LoadImage("INIMIGO 2.png"))
SetSpriteSize(inimigo2,150,150)
SetSpritePosition(inimigo2,500,0)
SetSpriteShape(inimigo2,3)
inimigo3=CreateSprite(LoadImage("INIMIGO 3.png"))
SetSpriteSize(inimigo3,150,150)
SetSpritePosition(inimigo3,500,0)
SetSpriteShape(inimigo3,3)
inimigo4=CreateSprite(LoadImage("INIMIGO 4.png"))
SetSpriteSize(inimigo4,150,150)
SetSpritePosition(inimigo4,500,0)
SetSpriteShape(inimigo4,3)
inimigo5=CreateSprite(LoadImage("INIMIGO 5.png"))
SetSpriteSize(inimigo5,150,150)
SetSpritePosition(inimigo5,500,0)
SetSpriteShape(inimigo5,3)
inimigo6=CreateSprite(LoadImage("INIMIGO 6.png"))
SetSpriteSize(inimigo6,150,150)
SetSpritePosition(inimigo6,500,0)
SetSpriteShape(inimigo6,3)


//////////////////////////////////////////////////
asteroide1=CreateSprite(LoadImage("ASTEROIDE.png"))
SetSpriteSize(asteroide1,150,150)
SetSpritePosition(asteroide1,900,0)
SetSpriteShape(asteroide1,3)
////////////////////////////////////////////////
asteroide2=CreateSprite(LoadImage("ASTEROIDE1.png"))
SetSpriteSize(asteroide2,150,150)
SetSpritePosition(asteroide2,700,0)
SetSpriteShape(asteroide2,3)
/////////////////////////////////////////////////
tiro=CreateSprite(LoadImage("TIRO1.png"))
SetSpriteSize(tiro,80,80)
SetSpritePosition(tiro,520,420)
SetSpriteVisible(tiro,0)
SetSpriteShape(tiro,3)
/////////////////////////////////////////////////
start=CreateSprite(LoadImage("START.png"))
SetSpriteSize(start,1104,621)
SetSpriteVisible(start,0)
////////////////////////////////////////////////////
#include "estrelas.agc"
#include "music.agc"
Gosub estrelas 	
verificador=0
particula=1
/////////////////////////////// SONS
tirosound=LoadSound("tirosound.wav")
explosao=LoadSound("explosao.wav")
dano=LoadSound("dano.wav")
perdeuscore=LoadSound("perdeuscore.wav")
gosub musicafundo
///////////////////////////////INIMIGO2
inimigo2x=random(5000,3000)
/////////////////////////////INIMIGO1
inimigox=random(5000,9000)
///////////////////////////////// INIMIGO 3 
inimigo3x=Random(3000,5000)
///////////////////////////////// INIMIGO 4 
inimigo4x=Random(3000,5000)
/////////////////////////////// INIMIGO 5 
inimigo5x=Random(3000,5000)
/////////////////////////////////// INIMIGO 6
inimigo6x=Random(3000,5000)

////////////////////////////////ASTEROIDE1
asteroidey as float 
asteroidex as float 
asteroided = 3
////////////////////////////////ASTEROIDE2
asteroide2y as float
asteroide2x as float
asteroide2d=3
//////////////////////////////////SCORE
score=0
highscore=0
gameover=1
vidas=4
CreateText(1,"SCORE : "+str(score))
SetTextSize(1,40)
SetTextPosition(1,0,0)
CreateText(3,"VIDAS : "+str(vidas))
SetTextSize(3,40)
SetTextPosition(3,0,40)
SetTextVisible(3,0)
SetTextVisible(1,0)

CreateText(2,"HIGHSCORE : "+str(highscore))
SetTextSize(2,40)
SetTextPosition(2,0,80)

//////////////////////////////////////
start=CreateSprite(LoadImage("START.png"))
SetSpriteSize(start,1104,621)
SetSpriteVisible(start,1)


do
	SetRawMouseVisible(0)
	if(GetRawKeyPressed(27)) and gameover=1
		end
		endif
	if(GetRawKeyPressed(13)) and gameover=1
		SetTextVisible(1,1)
		SetTextVisible(3,1)
		SetTextVisible(2,1)
		SetSpriteVisible(nave,1)
		SetSpriteVisible(tiro,1)
		SetSpriteVisible(inimigo1,1)
		SetSpriteVisible(inimigo2,1)
		SetSpriteVisible(inimigo3,1)
		SetSpriteVisible(inimigo4,1)
		SetSpriteVisible(inimigo5,1)
		SetSpriteVisible(inimigo6,1)
		SetSpriteVisible(asteroide1,1)
		SetSpriteVisible(asteroide2,1)
		SetSpriteVisible(start,0)
		SetSpritePosition(tiro,-1000,-1000)
		asteroidex=Random(100,1100)
		asteroidey=-50
		asteroide2x=Random(100,1100)
		asteroide2y=-50
		gameover=0
		endif

//////////////////////////////////////////NAVE
	gosub moverestrelas
	SetJoystickScreenPosition(nave,400,400)
	SetSpritePosition(nave,x,400)
	x=x+GetJoystickX()*15
	if(GetSpriteX(nave)<-85)
		x=-85
		endif
	if(GetSpriteX(nave)>880)
		x=880
		endif
////////////////////////////////////////////////// TIRO
	if(GetRawKeyPressed(32)) and verificador=0 and gameover=0
		playsound(tirosound)
		xs=GetSpriteX(nave)
		SetSpriteVisible(tiro,1)
		SetSpritePosition(tiro,xs+120,420)
		verificador=1
		endif
	if verificador=1
		SetSpritePosition(tiro,xs+109,GetSpriteY(tiro)-16)
		endif
	if GetSpriteY(tiro)<=0
		verificador=0
		SetSpritePosition(tiro,-1000,-1000)
		SetSpriteVisible=0
		endif
//////////////////////////////////////////////////	INIMIGO1
		SetSpritePosition(inimigo1,inimigox,GetSpriteY(inimigo1)+3)
		if score=10
			inimigox=Random(100,950)
			SetSpritePosition(inimigo1,inimigox,-150)
			endif
		if GetSpriteCollision(tiro,inimigo1)=1 and gameover=0
		PlaySound(explosao)
		score=score+10
		particula=particula+1
		x#=GetSpriteX(inimigo1)
		y#=GetSpriteY(inimigo1)
		particulas(particula,x#,y#)
		inimigox=Random(100,950)
		SetSpritePosition(inimigo1,inimigox,-150)
		verificador=0
		SetSpritePosition(tiro,-1000,-1000)
		endif
		if GetSpriteY(inimigo1)>660 and score>10
			inimigox=Random(100,950)
			SetSpritePosition(inimigo1,inimigox,-150)
			score=score-5
			playsound(perdeuscore)
		endif
///////////////////////////////////////////// INIMIGO 2 
		SetSpritePosition(inimigo2,inimigo2x,GetSpriteY(inimigo2)+2)
		if score=100
			inimigo2x=Random(100,950)
			SetSpritePosition(inimigo2,inimigo2x,-150)
			endif
			
		if GetSpriteCollision(tiro,inimigo2)=1 and gameover=0
			PlaySound(explosao)
			score=score+10
			particula=particula+1
			x#=GetSpriteX(inimigo2)
			y#=GetSpriteY(inimigo2)
			particulas(particula,x#,y#)
			inimigo2x=Random(100,950)
            SetSpritePosition(inimigo2,inimigo2x,-150)
			verificador=0
			SetSpritePosition(tiro,-1000,-1000)
			endif
			if GetSpriteY(inimigo2)>660 and score>100
			inimigo2x=Random(100,950)
			SetSpritePosition(inimigo2,inimigo2x,-150)
			score=score-5
			playsound(perdeuscore)
		endif
			
		
/////////////////////////////////////////////////// INIMIGO 3 
	SetSpritePosition(inimigo3,inimigo3x,GetSpriteY(inimigo3)+4)
	if score=300
		inimigo3x=random(100,950)
		SetSpritePosition(inimigo3,inimigo3x,-400)
		endif
	if score>1000
		SetSpritePosition(inimigo3,inimigo3x,GetSpriteY(inimigo3)+5)
		endif
		
	if GetSpriteCollision(tiro,inimigo3)=1 and gameover=0
		PlaySound(explosao)
		score=score+10
		particula=particula+1
		x#=GetSpriteX(inimigo3)
		y#=GetSpriteY(inimigo3)
		particulas(particula,x#,y#)
		inimigo3x=Random(100,950)
		SetSpritePosition(inimigo3,inimigo3x,-400)
		verificador=0
		SetSpritePosition(tiro,-1000,-1000)
		endif
		if GetSpriteY(inimigo3)>660 and score>300
			inimigo3x=Random(100,950)
			SetSpritePosition(inimigo3,inimigo3x,-400)
			score=score-5
			playsound(perdeuscore)
		endif
	
/////////////////////////////////////////////////// INIMIGO 4 
SetSpritePosition(inimigo4,inimigo4x,GetSpriteY(inimigo4)+3)
		if score=600
			inimigo4x=Random(100,950)
			SetSpritePosition(inimigo4,inimigo4x,-150)
			endif
		if GetSpriteCollision(tiro,inimigo4)=1 and gameover=0
		PlaySound(explosao)
		score=score+10
		particula=particula+1
		x#=GetSpriteX(inimigo4)
		y#=GetSpriteY(inimigo4)
		particulas(particula,x#,y#)
		inimigo4x=Random(100,950)
		SetSpritePosition(inimigo4,inimigo4x,-150)
		verificador=0
		SetSpritePosition(tiro,-1000,-1000)
		endif
		if GetSpriteY(inimigo4)>660 and score>600
			inimigo4x=Random(100,950)
			SetSpritePosition(inimigo4,inimigo4x,-150)
			score=score-5
			playsound(perdeuscore)
		endif

///////////////////////////////////////////////////// INIMIGO 5 
SetSpritePosition(inimigo5,inimigo5x,GetSpriteY(inimigo5)+4)
		if score=400
			inimigo5x=Random(100,950)
			SetSpritePosition(inimigo5,inimigo5x,-150)
			endif
		if GetSpriteCollision(tiro,inimigo5)=1 and gameover=0
		PlaySound(explosao)
		score=score+10
		particula=particula+1
		x#=GetSpriteX(inimigo5)
		y#=GetSpriteY(inimigo5)
		particulas(particula,x#,y#)
		inimigo5x=Random(100,950)
		SetSpritePosition(inimigo5,inimigo5x,-150)
		verificador=0
		SetSpritePosition(tiro,-1000,-1000)
		endif
		if GetSpriteY(inimigo5)>660 and score>400
			inimigo5x=Random(100,950)
			SetSpritePosition(inimigo5,inimigo5x,-150)
			score=score-5
			playsound(perdeuscore)
		endif
//////////////////////////////////////////////// INIMIGO 6 
SetSpritePosition(inimigo6,inimigo6x,GetSpriteY(inimigo6)+5)
		if score=800
			inimigo6x=Random(100,950)
			SetSpritePosition(inimigo6,inimigo6x,-150)
			endif
		if GetSpriteCollision(tiro,inimigo6)=1 and gameover=0
		PlaySound(explosao)
		score=score+10
		particula=particula+1
		x#=GetSpriteX(inimigo6)
		y#=GetSpriteY(inimigo6)
		particulas(particula,x#,y#)
		inimigo6x=Random(100,950)
		SetSpritePosition(inimigo6,inimigo6x,-150)
		verificador=0
		SetSpritePosition(tiro,-1000,-1000)
		endif
		if GetSpriteY(inimigo6)>660 and score>800
			inimigo6x=Random(100,950)
			SetSpritePosition(inimigo6,inimigo6x,-150)
			score=score-5
			playsound(perdeuscore)
		endif


///////////////////////////////////////////////// ASTEROIDE 1 

	asteroidey=asteroidey +1
	if asteroided=3 and asteroidex>GetVirtualWidth() -GetSpriteWidth(asteroide1)
		asteroided=-3
		endif
	asteroidex=asteroidex+asteroided
	if asteroided=-3 and asteroidex<0
		asteroided=3
		endif
	asteroidex=asteroidex+ asteroided
	SetSpritePosition(asteroide1,asteroidex,asteroidey)
	if GetSpriteCollision(tiro,asteroide1)=1 and gameover=0
		PlaySound(explosao)
		score=score+10
		particula=particula+1
		x#=GetSpriteX(asteroide1)
		y#=GetSpriteY(asteroide1)
		particulas(particula,x#,y#)
		asteroidex=Random(100,1600)
		asteroidey=-150
		verificador=0
		SetSpritePosition(tiro,-1000,-1000)
		endif
	if GetSpriteY(asteroide1)>660
		asteroidex=Random(100,1600)
		asteroidey=-150
		endif
////////////////////////////////////////////////// ASTEROIDE 2 
	asteroide2y=asteroide2y +1
	if asteroide2d=3 and asteroide2x>GetVirtualWidth() -GetSpriteWidth(asteroide2)
		asteroide2d=-3
		endif
	asteroide2x=asteroide2x+asteroide2d
	if asteroide2d=-3 and asteroide2x<0
		asteroide2d=3
		endif
	asteroide2x=asteroide2x+ asteroide2d
	SetSpritePosition(asteroide2,asteroide2x,asteroide2y)
	if GetSpriteCollision(tiro,asteroide2)=1 and gameover=0
		PlaySound(explosao)
		score=score+10
		particula=particula+1
		x#=GetSpriteX(asteroide2)
		y#=GetSpriteY(asteroide2)
		particulas(particula,x#,y#)
		asteroide2x=Random(100,1500)
		asteroide2y=-150
		verificador=0
		SetSpritePosition(tiro,-1000,-1000)
		endif
	if GetSpriteY(asteroide2)>660
		asteroide2x=Random(100,1600)
		asteroide2y=-150
		endif
////////////////////////////////////////////////////////PONTOS,VIDA
			SetTextString(1,"SCORE : "+str(score))
			SetTextString(3,"LIFE: "+str(vida))
			SetTextString(2,"HIGHSCORE: "+str(highscore))
	
////////////////////////////////////////////////////////// DANO
if GetSpriteCollision(nave,inimigo1)=1 and gameover=0
	playsound(dano)
	vida=vida-1
	inimigox=Random(100,950)
	SetSpritePosition(inimigo1,inimigox,-150)
	endif
if GetSpriteCollision(nave,inimigo2)=1 and gameover=0
	playsound(dano) 
	vida=vida-1
	inimigo2x=Random(100,950)
	SetSpritePosition(inimigo2,inimigo2x,-150)
	endif
if GetSpriteCollision(nave,inimigo3)=1 and gameover=0
	playsound(dano)
	vida=vida-1
	inimigo3x=random(100,950)
	SetSpritePosition(inimigo3,inimigo3x,-200)
	endif
if GetSpriteCollision(nave,inimigo4)=1 and gameover=0
	playsound(dano)
	vida=vida-1
	inimigo4x=random(100,950)
	SetSpritePosition(inimigo4,inimigo4x,-200)
	endif
if GetSpriteCollision(nave,inimigo5)=1 and gameover=0
	playsound(dano)
	vida=vida-1
	inimigo5x=random(100,950)
	SetSpritePosition(inimigo5,inimigo5x,-200)
	endif
	if GetSpriteCollision(nave,inimigo6)=1 and gameover=0
	playsound(dano)
	vida=vida-1
	inimigo6x=random(100,950)
	SetSpritePosition(inimigo6,inimigo6x,-200)
	endif
if GetSpriteCollision(nave,asteroide1)=1 and gameover=0
	playsound(dano)
	vida=vida-1
	asteroidex=Random(100,1600)
	asteroidey=-150
	endif
if GetSpriteCollision(nave,asteroide2)=1 and gameover=0
	playsound(dano)
	vida=vida-1
	asteroide2x=Random(100,1600)
	asteroide2y=-150
	endif
/////////////////////////////////////////////////////// AJUSTES
if gameover=0
	particula=particula+1
	endif
	
if(score>highscore)
	highscore=score
	endif
if vida=0
	gameover=1
	endif
if gameover=1
	SetSpritePosition(inimigo1,1000000000,100000000000)
	SetSpritePosition(inimigo2,1000000000,100000000000)
	SetSpritePosition(inimigo3,10000000000,10000000000)
	SetSpritePosition(inimigo4,10000000000,10000000000)
	SetSpritePosition(inimigo5,10000000000,10000000000)
	SetSpritePosition(inimigo6,10000000000,10000000000)
	SetSpritePosition(asteroide1,1000000000,100000000000)
	SetSpritePosition(asteroide2,1000000000,100000000000)
	SetSpriteVisible(start,1)
	SetSpriteVisible(nave,0)
	SetSpriteVisible(tiro,0)
	SetSpriteVisible(inimigo1,0)
	SetSpriteVisible(inimigo2,0)
	SetSpriteVisible(inimigo3,0)
	SetSpriteVisible(inimigo4,0)
	SetSpriteVisible(inimigo5,0)
	SetSpriteVisible(inimigo6,0)
	SetSpriteVisible(asteroide1,0)
	SetSpriteVisible(asteroide2,0)
	SetTextVisible(1,0)
	setTextVisible(3,0)
	setTextVisible(2,0)
	vida=4
	score=0
	endif
	//////////////////////////////////////////////////////PARTICULA
	function particulas(particula,x#,y#)
		CreateImageColor(particula,255,255,255,255)
		CreateParticles(particula,x#,y#)
		SetParticlesImage(particula,particula)
		ResetParticleCount(particula)
		SetParticlesDirection(particula,33,60)
		SetParticlesLife(particula,1)
		SetParticlesSize(particula,3)
		SetParticlesAngle(particula,360)
		SetParticlesFrequency(particula,20)
		SetParticlesVelocityRange(particula,1,3)
		SetParticlesMax(particula,12)
		AddParticlesColorKeyFrame(particula,0,0,100,255,0)
		AddParticlesColorKeyFrame(particula,0.5,0,100,255,255)
		AddParticlesColorKeyFrame(particula,2.0,150,50,100,255)
		AddParticlesColorKeyFrame(particula,3.0,0,0,0,0)
		sleep(10)
		endfunction 

	



	

	

	

	


    
    Sync()
loop
