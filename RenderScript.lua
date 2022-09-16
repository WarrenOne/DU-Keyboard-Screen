local rslib = require('rslib')
local json = require('dkjson')
rslib.drawQuickImage("assets.prod.novaquark.com/97299/eb84e827-5fbd-4949-9c1b-11282452091c.png")

--Formatting
key = ""
if caps==nil then caps = false end
rx,ry = getResolution()
rx,ry = rx/100,ry/100
LogoLayer = createLayer()
BlockLayer = createLayer()
LetterLayer = createLayer()
setDefaultFillColor(BlockLayer,Shape_Box,.04,.08,.1,.8)
setDefaultTextAlign(LetterLayer, AlignH_Center, AlignV_Bottom)
LetterFont = loadFont("Play",10*ry)
mx,my = getCursor()
mx,my = math.floor(mx),math.floor(my)
RowX = {1,11,21,31,41,51,61,71,81,91}
if caps==true then
    Row1 = {"1","2","3","4","5","6","7","8","9","0"}
    Row2 = {"Q","W","E","R","T","Y","U","I","O","P"}
    Row3 = {"A","S","D","F","G","H","J","K","L",":"}
    Row4 = {"Z","X","C","V","B","N","M",",",".","?"}
else
    Row1 = {"1","2","3","4","5","6","7","8","9","0"}
    Row2 = {"q","w","e","r","t","y","u","i","o","p"}
    Row3 = {"a","s","d","f","g","h","j","k","l",":"}
    Row4 = {"z","x","c","v","b","n","m",",",".","?"}
end


--Add Key Boxes and Detect Key
for i=1,#RowX do
    if mx>=RowX[i]*rx and mx<=(RowX[i]+8)*rx and my>=14*ry and my<=26*ry then
        setNextFillColor(BlockLayer,.12,.24,.3,.8)
        key = Row1[i]
    end
    addBox(BlockLayer,RowX[i]*rx,14*ry,8*rx,12*ry)
    
    if mx>=RowX[i]*rx and mx<=(RowX[i]+8)*rx and my>=29*ry and my<=41*ry then
        setNextFillColor(BlockLayer,.12,.24,.3,.8)
        key = Row2[i]
    end
    addBox(BlockLayer,RowX[i]*rx,29*ry,8*rx,12*ry)
    
    if mx>=RowX[i]*rx and mx<=(RowX[i]+8)*rx and my>=44*ry and my<=56*ry then
        setNextFillColor(BlockLayer,.12,.24,.3,.8)
        key = Row3[i]
    end
    addBox(BlockLayer,RowX[i]*rx,44*ry,8*rx,12*ry)
    
    if mx>=RowX[i]*rx and mx<=(RowX[i]+8)*rx and my>=59*ry and my<=71*ry then
        setNextFillColor(BlockLayer,.12,.24,.3,.8)
        key = Row4[i]
    end
    addBox(BlockLayer,RowX[i]*rx,59*ry,8*rx,12*ry)
end

--Caps Block
if mx>=91*rx and mx<=99*rx and my>=74*ry and my<=86*ry then
    if getCursorPressed()==true then caps = not caps end
    setNextFillColor(BlockLayer,.12,.24,.3,.8)
    key = "caps"
end
addBox(BlockLayer,91*rx,74*ry,8*rx,12*ry)

--Space Block

if mx>=31*rx and mx<=69*rx and my>=74*ry and my<=86*ry then
    setNextFillColor(BlockLayer,.12,.24,.3,.8)
    key = "space"
end
addBox(BlockLayer,31*rx,74*ry,38*rx,12*ry)

--Add Letters
for i=1,#Row1 do
    x = (RowX[i]+4)*rx
    y = 24*ry
    addText(LetterLayer,LetterFont,Row1[i],x,y)
end

for i=1,#Row2 do
    x = (RowX[i]+4)*rx
    y = 39*ry
    addText(LetterLayer,LetterFont,Row2[i],x,y)
end

for i=1,#Row3 do
    x = (RowX[i]+4)*rx
    y = 54*ry
    addText(LetterLayer,LetterFont,Row3[i],x,y)
end

for i=1,#Row4 do
    x = (RowX[i]+4)*rx
    y = 69*ry
    addText(LetterLayer,LetterFont,Row4[i],x,y) 
end

--Caps Arrow
addTriangle(LetterLayer, 92*rx,84*ry, 98*rx,84*ry, 95*rx,76*ry)

--Space Label
addText(LetterLayer,LetterFont,"Space",50*rx,86*ry)

--Logo
LogoLayer = createLayer() --Logo Layer Creation
Logo = loadImage("assets.prod.novaquark.com/97299/0488108b-9218-450e-98e5-ec6b98bef3fd.png") --Logo Load
if isImageLoaded(Logo)==true then addImage(LogoLayer,Logo,0*rx,78*ry,14*rx,14*rx) end --Logo

--[[Log
LogLayer = createLayer()
LogFont = loadFont("Play",5*ry)
setDefaultTextAlign(LogLayer, AlignH_Left, AlignV_Bottom)
addText(LogLayer,LogFont,"Key:"..key,1*rx,99*ry)]]

setOutput(key)
requestAnimationFrame(5)
