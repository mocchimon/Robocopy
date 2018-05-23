if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)

START cmd.exe net /k "stop audiosrv"
SLEEP 5
START cmd.exe /k "net stop AudioEndpointBuilder"
SLEEP 5
START cmd.exe /k "net start audiosrv"
SLEEP 5
START cmd.exe /k "net start AudioEndpointBuilder"
