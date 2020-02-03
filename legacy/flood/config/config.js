const CONFIG = {
  baseURI: '/',
  dbCleanInterval: 1000 * 60 * 60,
  dbPath: './server/db/',
  floodServerHost: '0.0.0.0',
  floodServerPort: 80,
  // floodServerProxy: 'http://127.0.0.1:3000',
  maxHistoryStates: 30,
  torrentClientPollInterval: 1000 * 2,
  secret: 'flood',
  // ssl: false,
  // sslKey: '/absolute/path/to/key/',
  // sslCert: '/absolute/path/to/certificate/',
  scgi: {
    host: process.env.RTORRENT_SCGI_HOST || 'rtorrent',
    port: process.env.RTORRENT_SCGI_PORT || 5000,
    // socket: true,
    // socketPath: '/tmp/rtorrent.sock'
  }
};

// Do not remove the below line.
module.exports = CONFIG;
