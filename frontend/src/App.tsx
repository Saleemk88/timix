import { useState, useEffect } from 'react'

function App() {
  const [backendStatus, setBackendStatus] = useState<string>('Checking...')

  useEffect(() => {
    fetch('/api/health')
      .then(res => res.json())
      .then(data => setBackendStatus(data.status))
      .catch(err => {
        console.error("Error fetching backend health:", err)
        setBackendStatus('Offline')
      })
  }, [])

  return (
    <div style={{ fontFamily: 'sans-serif', padding: '2rem', textAlign: 'center' }}>
      <h1>Welcome to Timix</h1>
      <p>The comprehensive time-tracking platform.</p>
      <div style={{ marginTop: '2rem', padding: '1rem', border: '1px solid #ccc', borderRadius: '8px', display: 'inline-block' }}>
        <h3>System Status</h3>
        <p>Backend API: <strong>{backendStatus}</strong></p>
      </div>
    </div>
  )
}

export default App
