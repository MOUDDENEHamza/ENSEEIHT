machine lamp {
   event switchOn
   event switchOff
   region bulb {
      state Off starts ends
      state On
   }
   from bulb.Off to buld.On on switchOn
   from buld.On to buld.Off on SwitchOff
}
