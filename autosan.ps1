
Add-Type -AssemblyName System.IO.FileSystem

$Pathcur = Get-Location

Write-Host "Monitoring content of $Pathcur"
$PathToMonitor = Join-Path -Path $Pathcur -ChildPath "src"
Write-Host "Monitoring content of $PathToMonitor"



$watchr = New-Object System.IO.FileSystemWatcher
$watchr.Path = $PathToMonitor
$watchr.IncludeSubdirectories =$true
$watchr.Filter="*.*"


### define actions after an event is detected
$action ={
  $path =$Event.SourceEventArgs.FullPath
  $changeType =$Event.SourceEventArgs.changeType
  $logline ="$(Get-Date),$changeType,$path"
  if (Test-Path ".\monitor"){
	echo floder monitor exist . >> .\monitor\log.txt
	}else{
	mkdir monitor
  	add-content "./monitor/log.txt" -value $logline
	}
  
  $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
  Write-Host "file changes from $changeType to $path at : $timestamp "
  rm log.txt
  echo "" >> log.txt
  echo  "===========================================================================================" >> log.txt
  
  echo  "===============================CMAKE BUILD START===========================================" >> log.txt
  echo  "===========================================================================================" >> log.txt

  cmake.exe -S . -B build -G "MinGW Makefiles" >> log.txt
  rm compile_commands.json >> log.txt
  copy .\build\compile_commands.json >> log.txt

  echo  "===========================================================================================" >> log.txt
  echo  "=====================================MinGW MAKE START======================================" >> log.txt
  echo  "===========================================================================================" >> log.txt
  mingw32-make.exe -C .\build\ >>log.txt
  if (Test-Path ".\build\hello.exe"){
  c:\qt\6.5.3\mingw_64\bin\windeployqt.exe .\build\helloworld.exe >> log.txt 
  }

  $txtContent = Get-Content log.txt

  foreach ($line in $txtContent) {
    <# $line is the current item #>
    Write-Host $line
  }
  copy compile_commands.json .\build\     
}


### decide with event should be watched
Register-ObjectEvent $watchr "Changed" -Action $action

