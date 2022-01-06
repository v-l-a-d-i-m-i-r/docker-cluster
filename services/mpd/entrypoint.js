#!/usr/bin/env node

const { readFileSync, writeFileSync } = require('fs');
const { execSync, spawn, exec } = require('child_process');

const { ALSA_DEVICE, PUID = 1000, PGID = 1000 } = process.env;

const configFilePath='/etc/mpd.conf';

const render = (template, data = {}) => [
    /\$([^\s\{\}]+)/g, // $NAME
    /\${([^\s:]+)}/g,  // ${NAME_NAME}
    /\${([^\s]+):-([^\s]+)?}/g // ${NAME:-John}
  ]
  .map(regex => {
    let execution;
    const executions = [];

    while ((execution = regex.exec(template)) !== null) {
      executions.push(execution);
    }

    return executions;
  })
  .filter(executions => executions.length)
  .reduce((arr, executions) => [...arr, ...executions], [])
  .map(([match, variableName, defaultValue]) => [match, data[variableName] || defaultValue])
  .reduce((string, replacements) => string.replace(...replacements), template);

const createDevicesMap = string => string
  .split('\n')
  .filter(Boolean)
  .map(string => string.split(', '))
  .map(([cardString, deviceString]) => {
    const [_, cardIndex, cardType, cardName] = /^card\s(.+):\s(.+)\s\[(.+)\]$/.exec(cardString);
    const [__, deviceIndex, deviceType, deviceName] = /^device\s(.+):\s(.+)\s\[(.+)\]$/.exec(deviceString);

    return [
      { index: cardIndex, type: cardType, name: cardName },
      { index: deviceIndex, type: deviceType, name: deviceName}
    ];
  })
  .reduce((acc, [card, device]) => {
    const cardIndex = card.index;
    const deviceIndex = device.index;

    if (!acc[cardIndex]) {
      acc[cardIndex] = { ...card, devices: {} };
    }

    acc[cardIndex].devices[deviceIndex] = device;

    return acc;
  }, {});

const getDeviceLabel = (deviceKey, devicesMap) => {
  const regex = /^hw:(\d)+,(\d)+$/;

  const isDeviceKeyValid = regex.test(deviceKey);

  if (!isDeviceKeyValid) {
    throw new Error('Device key is invalid');
  }

  const [_, cardIndex, deviceIndex] = regex.exec(deviceKey);

  const card = devicesMap[cardIndex];
  const device = devicesMap[cardIndex].devices[deviceIndex];

  return `${card.name} (${device.name})`;
}

const asoundOutput = execSync('aplay -l | grep ^card').toString();

console.log(asoundOutput);
const devicesMap = createDevicesMap(asoundOutput);
const deviceLabel = getDeviceLabel(ALSA_DEVICE, devicesMap);

const configFileTemplate = readFileSync(configFilePath).toString('utf-8');
const configFile = render(configFileTemplate, { ...process.env, ALSA_DEVICE_LABEL: deviceLabel });

writeFileSync(configFilePath, configFile);

execSync(`usermod -u ${PUID} mpd`);
execSync(`groupmod -g ${PGID} mpd`);

execSync('mkdir -p /mpd/cache /mpd/music /mpd/playlists');

execSync('test -f /mpd/cache/state || touch /mpd/cache/state');
execSync('sed -i "s/^state: .*/state: pause/" /mpd/cache/state');
execSync('test -f /mpd/cache/tag_cache || touch /mpd/cache/tag_cache');
execSync('test -f /mpd/cache/sticker.sql || touch /mpd/cache/sticker.sql');

execSync('chown -R mpd:mpd /mpd/cache /mpd/music /mpd/playlists');

// console.log(readFileSync(configFilePath).toString('utf-8'));
const proc = spawn('mpd', [ '--no-daemon', '--stdout', '--verbose', configFilePath]);
const { stdout, stderr } = proc;

stdout.pipe(process.stdout);
stderr.pipe(process.stderr);

proc.on('exit', (code) => process.exit(code));
