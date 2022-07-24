Function init()
  
  uri = get_image_url()
  m.top.backgroundUri = uri
  
End Function

Function get_image_url() as object
    request = CreateObject("roUrlTransfer")
    port = CreateObject("roMessagePort")
    request.SetMessagePort(port)
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
    return invalid
End Function