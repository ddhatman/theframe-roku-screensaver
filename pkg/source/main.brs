Sub RunScreenSaver()
	screen = createObject("roSGScreen")
	m.port = createObject("roMessagePort")
	screen.setMessagePort(m.port)

	m.global = screen.getGlobalNode()

  uri = get_image_url()
	shadecolor = get_shade_color()

  scene = screen.createScene("TheFrameScreensaver")
  scene.artworkuri = uri
  scene.shadecolor = shadecolor
	screen.show()
    
	while(true) 'While loop that is apparently needed to keep the screen alive
      msg = wait(8000, m.port)

      shadecolor = get_shade_color()
      scene.shadecolor = shadecolor

      if (msg <> invalid)
          msgType = type(msg)
          if msgType = "roSGScreenEvent"
              if msg.isScreenClosed() then return
          end if
      end if
  end while
End Sub

Function get_image_url() as object
    date = CreateObject("roDateTime")
    date.ToLocalTime()
    dateString = date.ToISOString()

    request = CreateObject("roUrlTransfer")
    port = CreateObject("roMessagePort")
    request.SetMessagePort(port)
    request.SetCertificatesFile("common:/certs/ca-bundle.crt")
    request.AddHeader("X-Roku-Reserved-Dev-Id", "")
    request.InitClientCertificates()
    request.EnableHostVerification(false)
    request.SetUrl("https://theframe-app.azurewebsites.net/api/active-image?user=1&token=1&date=" + dateString)
    if (request.AsyncGetToString())
        while (true)
            msg = wait(0, port)
            if (type(msg) = "roUrlEvent")
                code = msg.GetResponseCode()
                if (code = 200)
                    img_url = msg.GetString()
                    return img_url
                endif
            else if (event = invalid)
                request.AsyncCancel()
            endif
        end while
    endif
    return "https://raw.githubusercontent.com/ddhatman/theframe-roku-screensaver/master/assets/tv-background-sedona.jpg"
End Function

Function get_shade_color() as string
  
  date = CreateObject("roDateTime")
  date.ToLocalTime()
  hour = date.GetHours()
  opacity = "BB"

  if (hour = 6)
    opacity = "AA"
  endif
  if (hour = 7)
    opacity = "99"
  endif
  if (hour = 8)
    opacity = "77"
  endif
  if (hour = 9)
    opacity = "55"
  endif
  if (hour = 10)
    opacity = "33"
  endif
  if (hour = 11)
    opacity = "22"
  endif
  if (hour = 12)
    opacity = "22"
  endif
  if (hour = 13)
    opacity = "22"
  endif
  if (hour = 14)
    opacity = "33"
  endif
  if (hour = 15)
    opacity = "55"
  endif
  if (hour = 16)
    opacity = "77"
  endif
  if (hour = 17)
    opacity = "99"
  endif
  
  return "0x2A2000" + opacity

End Function