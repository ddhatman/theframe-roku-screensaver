Sub RunScreenSaver()
	screen = createObject("roSGScreen")
	m.port = createObject("roMessagePort")
	screen.setMessagePort(m.port)

	m.global = screen.getGlobalNode()

  uri = get_image_url()
	
  scene = screen.createScene("TheFrameScreensaver")
  scene.artworkuri = uri
	screen.show()
    
	while(true) 'While loop that is apparently needed to keep the screen alive
      msg = wait(8000, m.port)
      if (msg <> invalid)
          msgType = type(msg)
          if msgType = "roSGScreenEvent"
              if msg.isScreenClosed() then return
          end if
      end if
  end while
End Sub

Function get_image_url() as object
    request = CreateObject("roUrlTransfer")
    port = CreateObject("roMessagePort")
    request.SetMessagePort(port)
    request.SetCertificatesFile("common:/certs/ca-bundle.crt")
    request.AddHeader("X-Roku-Reserved-Dev-Id", "")
    request.InitClientCertificates()
    request.EnableHostVerification(false)
    request.SetUrl("https://theframe-app.azurewebsites.net/api/active-image?user=1&token=1")
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