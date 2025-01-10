  local points_pallet1 = {}
  PalletCreate({P3,P4},{2},points_pallet1)
pallet_count = 1
state = 1
MovJ((P1))
Sync()
while 1 do
  Sync()
  if (DI(12))==1 then
    Sync()
    if state<3 then
      MovJ((P6))
      MovL((P2))
      Vacuum( )
      MovL((P6))
      MovJ((P5))
      Jump(points_pallet1[pallet_count], {Start=60, ZLimit=74, End=60})
      Sync()
      if 0==0 then
        Pressure( )
      end
      MovJ((P5))
      MovJ((P1))
      pallet_count = pallet_count + 1
      state = state + 1
      ACK( )
      Sync()
      if pallet_count>2 then
        pallet_count = 1
      end
    else
      MovJ((P5))
      Jump(points_pallet1[pallet_count], {Start=60, ZLimit=74, End=60})
      Vacuum( )
      MovJ((P5))
      MovJ((P6))
      MovL((P2))
      Sync()
      if 0==0 then
        Pressure( )
      end
      MovL((P6))
      MovJ((P1))
      pallet_count = pallet_count + 1
      state = state + 1
      ACK( )
      Sync()
      if pallet_count>2 then
        pallet_count = 1
      end
      Sync()
      if state>4 then
        state = 1
      end
    end
  end
  Sleep(50)
end
