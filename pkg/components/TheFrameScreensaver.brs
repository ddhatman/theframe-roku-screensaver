Function init()
  img = "sedona"
  date = CreateObject("roDateTime")
  date.ToLocalTime()

  mo = date.getMonth()
  dy = date.getDayOfMonth()

  if mo = 1 then
    img = "wintermountains"
  else if mo = 2 then
    img = "wintermountains"
  else if mo = 3 then
    img = "nature1"
  else if mo = 4 then 
    img = "nature2"
  else if mo = 5 then
    img = "beach"
  else if mo = 6 then 
    img = "beach"
  else if mo = 7 then 
    if dy = 4 then
      img = "fireworks"
    else if mo < 20
      img = "beach"
    else
      img = "sedona"
    end if
  else if mo = 8 then 
    img = "sedona"
  else if mo = 9 then 
    if dy < 20 then
      img = "sedona"
    else
      img = "royalpalms"
    end if
  else if mo = 10 then
    if dy < 14 then
      img = "royalpalms"
    else if dy = 14 then
      img = "birthday"
    else if dy = 31 then
      img = "halloween"
    else
      img = "fallpumpkins"
    end if
  else if mo = 11 then
    img = "fallpumpkins"
  else if mo = 12 then
    if dy = 4 then
      img = "disneyxmas"
    else if dy < 28 then
      img = "disneyxmas"
    else if dy = 31 then
      img = "fireworks"
    else
      img = "wintermountains"
    end if
  end if
  
  m.top.backgroundUri = "https://raw.githubusercontent.com/ddhatman/theframe-roku-screensaver/master/assets/tv-background-" + img + ".jpg"
  
End Function