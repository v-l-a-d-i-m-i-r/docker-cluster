## Get list of devices
``` sh
aplay -l
```

### Example output
``` sh
**** List of PLAYBACK Hardware Devices ****
card 0: Intel [HDA Intel], device 0: ALC662 rev1 Analog [ALC662 rev1 Analog]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: FXAUDIODACX6 [FX-AUDIO-DAC-X6], device 0: USB Audio [USB Audio]
  Subdevices: 0/1
  Subdevice #0: subdevice #0
card 1: FXAUDIODACX6 [FX-AUDIO-DAC-X6], device 1: USB Audio [USB Audio #1]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
```

### Mpd config settings
``` sh
...

audio_output {
  ...

  name "FX-AUDIO-DAC-X6"
  device "hw:FXAUDIODACX6"

  ...
}

...
```

### Get list of mixers per device
``` sh
amixer -c FXAUDIODACX6
```

### Example output
``` sh
Simple mixer control 'PCM',0
  Capabilities: pvolume pswitch pswitch-joined
  Playback channels: Front Left - Front Right
  Limits: Playback 0 - 110
  Mono:
  Front Left: Playback 101 [92%] [-4.50dB] [on]
  Front Right: Playback 101 [92%] [-4.50dB] [on]
Simple mixer control 'PCM Capture Source',0
  Capabilities: enum
  Items: 'Line' 'IEC958 In'
  Item0: 'Line'
Simple mixer control 'Line',0
  Capabilities: cvolume cswitch cswitch-joined
  Capture channels: Front Left - Front Right
  Limits: Capture 0 - 104
  Front Left: Capture 80 [77%] [0.00dB] [on]
  Front Right: Capture 80 [77%] [0.00dB] [on]
Simple mixer control 'IEC958 In',0
  Capabilities: cswitch cswitch-joined
  Capture channels: Mono
  Mono: Capture [on]
```

### Mpd config settings
``` sh
...

audio_output {
  ...

  mixer_type "hardware"
  mixer_device "hw:FXAUDIODACX6"
  mixer_control "PCM"

  ...
}

...
```

## Links
[Configuring volume control for USB-DAC to be used via mpd](https://stackoverflow.com/questions/22283154/configuring-volume-control-for-usb-dac-to-be-used-via-mpd)
[Alsa Digital Out](https://alsa.opensrc.org/DigitalOut)
