dotnet sonarscanner begin /k:"HRMS_API_HRMS_API_AYp0FrMTF9BUVmbqt-T3" /d:sonar.host.url="http://localhost:9000"  /d:sonar.token="sqp_430d264084d6accb7d3c2a81e9f97144066120be"
dotnet build
dotnet sonarscanner end /d:sonar.token="sqp_200ed7a015c89239d8b7dc66f2303ac5769db502"