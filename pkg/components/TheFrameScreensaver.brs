Function init()

  'matte: 1920w x 1080h @ 0,0
  'photo: 1750w x 910h  @ 85,85

End Function

sub updateartwork()
  
  poster = m.top.findNode("artwork")
  poster.uri = m.top.artworkuri

end sub
