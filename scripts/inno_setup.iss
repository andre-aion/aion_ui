; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "AionWallet"
#define MyAppVersion "1.1"
#define MyAppPublisher "Aion"
#define MyAppURL "http://www.aion.network/"
#define MyAppExeName "AionWallet.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{49D782D3-43D8-47F2-914A-3DEA3D29CB62}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DisableProgramGroupPage=yes
OutputBaseFilename=AionWalletSetup
Compression=lzma
SolidCompression=yes
PrivilegesRequired=admin


[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "C:\Projects\aion_ui\pack\aion_ui\*"; DestDir: "{app}"; Excludes: "unzip.exe, cygwin1.dll, cygintl-8.dll, cygiconv-2.dll, cygbz2-1.dll, libintl-2.dll, libiconv-2.dll, gzip.exe, wget.exe, tar.exe, *.zip"; Flags: ignoreversion recursesubdirs createallsubdirs;
Source: "C:\Projects\aion_ui\pack\aion_ui\unzip.exe"; DestDir: "{tmp}"; Flags: ignoreversion
Source: "C:\Projects\aion_ui\pack\aion_ui\*.dll"; DestDir: "{tmp}"; Flags: ignoreversion
Source: "C:\Projects\aion_ui\pack\aion_ui\wget.exe"; DestDir: "{tmp}"; Flags: ignoreversion
Source: "C:\Projects\aion_ui\pack\aion_ui\gzip.exe"; DestDir: "{tmp}"; Flags: ignoreversion
Source: "C:\Projects\aion_ui\pack\aion_ui\tar.exe"; DestDir: "{tmp}"; Flags: ignoreversion
Source: "C:\Projects\aion_ui\pack\aion_ui\native\win\ledger\Aion-HID.zip"; DestDir: "{tmp}";  Flags: deleteafterinstall
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{commonprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{tmp}\unzip.exe"; Parameters: """{tmp}\Aion-HID.zip"" ""-d"" ""{app}\native\win\ledger""";
Filename: "{tmp}\wget.exe"; Parameters: """-nc"" ""--no-check-certificate"" ""--no-cookies"" ""--header"" ""Cookie: oraclelicense=accept-securebackup-cookie"" ""http://download.oracle.com/otn-pub/java/jdk/10.0.2+13/19aef61b38124481863b1413dce1855f/jre-10.0.2_windows-x64_bin.exe""  ""-O"" ""{tmp}\java.exe""";
Filename: "{tmp}\tar.exe"; Parameters: """xzf"" ""{tmp}\java.tar.gz""";
Filename: "{tmp}\java.exe";
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent


[UninstallDelete]
Type: filesandordirs; Name: "{app}\native*"
Type: filesandordirs; Name: "{app}\"