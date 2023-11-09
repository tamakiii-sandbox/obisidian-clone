const { app, BrowserWindow, ipcMain } = require('electron')
const path = require('path')

app.whenReady().then(() => {
  const width: number = 800
  const height: number = 600
  const window = new BrowserWindow({
    width,
    height,
    webPreferences: {
      preload: path.join(__dirname, 'preload.js'),
      nodeIntegration: true,
    }
  })

  window.loadFile('index.html')
  ipcMain.handle('ping', () => 'pong')
})
