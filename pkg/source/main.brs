Sub RunScreenSaver()
	screen = createObject("roSGScreen")
	m.port = createObject("roMessagePort")
	screen.setMessagePort(m.port)

	m.global = screen.getGlobalNode()

	scene = screen.createScene("TheFrameScreensaver")
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

'Sub RunScreenSaverSettings()
'End Sub