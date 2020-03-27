; Variables
	#define MyAppName "copyDetails"
	#define MyAppVersion "4.8.356"
	#define MyAppPublisher "mythofechelon"
	#define MyAppURL "https://www.mythofechelon.co.uk/"

[Setup]
	; App Details
		AppId={{5e781496-deae-44e2-9c41-1a9d3fe308a8}
		AppName={#MyAppName}
		AppVersion={#MyAppVersion}
		AppPublisher={#MyAppPublisher}
		AppPublisherURL={#MyAppURL}
		VersionInfoVersion={#MyAppVersion}
		VersionInfoCompany={#MyAppPublisher}
		VersionInfoProductName={#MyAppName}
		VersionInfoDescription={#MyAppName}
		VersionInfoProductVersion={#MyAppVersion}
		UninstallDisplayName={#MyAppName}
		UninstallDisplayIcon={app}\icons\copy.ico
		ArchitecturesInstallIn64BitMode=x64

	; Files
		OutputDir=.
		OutputBaseFilename={#MyAppName}-{#MyAppVersion}-x86_x64-setup
		SetupIconFile=icons\copy.ico

	; Installation / Uninstallation
		DefaultDirName={autopf}\{#MyAppPublisher}\{#MyAppName}
		UsePreviousPrivileges=yes
		PrivilegesRequired=lowest
		PrivilegesRequiredOverridesAllowed=dialog 
		WizardStyle=modern

	; Compiler
		Compression=lzma2
		SolidCompression=yes	

[Files]
	Source: "x64\copyDetails.exe"; DestDir: "{app}"; Check: IsWin64;
	Source: "x86\copyDetails.exe"; DestDir: "{app}"; Check: not IsWin64;
	Source: "notes\Versions.txt"; DestDir: "{app}\notes";
	Source: "icons\copy.ico"; DestDir: "{app}\icons";
	Source: "icons\paste.ico"; DestDir: "{app}\icons";

[Registry]
	; Drives
		Root: HKA; Subkey: "SOFTWARE\Classes\Drive\Shell\copyDetails..."; Flags: uninsdeletekey;
		Root: HKA; Subkey: "SOFTWARE\Classes\Drive\Shell\copyDetails..."; ValueType: string; ValueName: "MUIVerb"; ValueData: "copyDetails...";
		Root: HKA; Subkey: "SOFTWARE\Classes\Drive\Shell\copyDetails..."; ValueType: string; ValueName: "Position"; ValueData: "Middle";
		Root: HKA; Subkey: "SOFTWARE\Classes\Drive\Shell\copyDetails..."; ValueType: string; ValueName: "SeparatorBefore"; ValueData: "";
		Root: HKA; Subkey: "SOFTWARE\Classes\Drive\Shell\copyDetails..."; ValueType: string; ValueName: "SeparatorAfter"; ValueData: "";
		Root: HKA; Subkey: "SOFTWARE\Classes\Drive\Shell\copyDetails..."; ValueType: string; ValueName: "Icon"; ValueData: "{app}\icons\copy.ico";
		Root: HKA; Subkey: "SOFTWARE\Classes\Drive\Shell\copyDetails..."; ValueType: string; ValueName: "SubCommands"; ValueData: "";
		Root: HKA; Subkey: "SOFTWARE\Classes\Drive\Shell\copyDetails...\Shell"; 
			Root: HKA; Subkey: "SOFTWARE\Classes\Drive\Shell\copyDetails...\Shell\driveLetter"; ValueType: string; ValueData: "driveLetter"; 
			Root: HKA; Subkey: "SOFTWARE\Classes\Drive\Shell\copyDetails...\Shell\driveLetter\command"; ValueType: string; ValueData: "{app}\copyDetails.exe -i %1 -m driveLetter";
			
			Root: HKA; Subkey: "SOFTWARE\Classes\Drive\Shell\copyDetails...\Shell\driveLetter_Colon"; ValueType: string; ValueData: "driveLetter:"; 
			Root: HKA; Subkey: "SOFTWARE\Classes\Drive\Shell\copyDetails...\Shell\driveLetter_Colon\command"; ValueType: string; ValueData: "{app}\copyDetails.exe -i %1 -m driveLetter_Colon";

	; Folders
		Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Shell\copyDetails..."; Flags: uninsdeletekey;
		Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Shell\copyDetails..."; ValueType: string; ValueName: "MUIVerb"; ValueData: "copyDetails...";
		Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Shell\copyDetails..."; ValueType: string; ValueName: "Position"; ValueData: "Middle" ;
		Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Shell\copyDetails..."; ValueType: string; ValueName: "SeparatorBefore"; ValueData: "";
		Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Shell\copyDetails..."; ValueType: string; ValueName: "SeparatorAfter"; ValueData: "";
		Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Shell\copyDetails..."; ValueType: string; ValueName: "Icon"; ValueData: "{app}\icons\copy.ico";
		Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Shell\copyDetails..."; ValueType: string; ValueName: "SubCommands"; ValueData: "";
		Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Shell\copyDetails...\Shell";
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Shell\copyDetails...\Shell\01.fullPath"; ValueType: string; ValueData: " fullPath"; 
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Shell\copyDetails...\Shell\01.fullPath\command"; ValueType: string; ValueData: "{app}\copyDetails.exe -i ""%1"" -m fullPath";
			
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Shell\copyDetails...\Shell\02.fullPath_Quotes"; ValueType: string; ValueData: """fullPath"""; 
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Shell\copyDetails...\Shell\02.fullPath_Quotes\command"; ValueType: string; ValueData: "{app}\copyDetails.exe -i ""%1"" -m fullPath_Quotes";
			
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Shell\copyDetails...\Shell\03.fullPath_Backslash"; ValueType: string; ValueData: " fullPath\"; 
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Shell\copyDetails...\Shell\03.fullPath_Backslash\command"; ValueType: string; ValueData: "{app}\copyDetails.exe -i ""%1"" -m fullPath_Backslash";
			
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Shell\copyDetails...\Shell\04.fullPath_Backslash_Quotes"; ValueType: string; ValueData: """fullPath\"""; 
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Shell\copyDetails...\Shell\04.fullPath_Backslash_Quotes\command"; ValueType: string; ValueData: "{app}\copyDetails.exe -i ""%1"" -m fullPath_Backslash_Quotes";
			
			; Insert seperator below
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Shell\copyDetails...\Shell\04.fullPath_Backslash_Quotes"; ValueType: dword; ValueName: "CommandFlags"; ValueData: "$00000040";
			
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Shell\copyDetails...\Shell\05.driveLetter"; ValueType: string; ValueData: "driveLetter"; 
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Shell\copyDetails...\Shell\05.driveLetter\command"; ValueType: string; ValueData: "{app}\copyDetails.exe -i ""%1"" -m driveLetter";
			
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Shell\copyDetails...\Shell\06.driveLetter_Colon"; ValueType: string; ValueData: "driveLetter:"; 
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Shell\copyDetails...\Shell\06.driveLetter_Colon\command"; ValueType: string; ValueData: "{app}\copyDetails.exe -i ""%1"" -m driveLetter_Colon";
			
			; Insert seperator below
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Shell\copyDetails...\Shell\06.driveLetter_Colon"; ValueType: dword; ValueName: "CommandFlags"; ValueData: "$00000040";
			
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Shell\copyDetails...\Shell\07.currentPath"; ValueType: string; ValueData: " currentPath"; 
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Shell\copyDetails...\Shell\07.currentPath\command"; ValueType: string; ValueData: "{app}\copyDetails.exe -i ""%1"" -m currentPath";
			
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Shell\copyDetails...\Shell\08.currentPath_Quotes"; ValueType: string; ValueData: """currentPath"""; 
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Shell\copyDetails...\Shell\08.currentPath_Quotes\command"; ValueType: string; ValueData: "{app}\copyDetails.exe -i ""%1"" -m currentPath_Quotes";
			
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Shell\copyDetails...\Shell\09.currentPath_Backslash"; ValueType: string; ValueData: " currentPath\"; 
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Shell\copyDetails...\Shell\09.currentPath_Backslash\command"; ValueType: string; ValueData: "{app}\copyDetails.exe -i ""%1"" -m currentPath_Backslash";
			
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Shell\copyDetails...\Shell\10.currentPath_Backslash_Quotes"; ValueType: string; ValueData: """currentPath\"""; 
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Shell\copyDetails...\Shell\10.currentPath_Backslash_Quotes\command"; ValueType: string; ValueData: "{app}\copyDetails.exe -i ""%1"" -m currentPath_Backslash_Quotes";
			
			; Insert seperator below
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Shell\copyDetails...\Shell\10.currentPath_Backslash_Quotes"; ValueType: dword; ValueName: "CommandFlags"; ValueData: "$00000040";
			
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Shell\copyDetails...\Shell\11.folderName"; ValueType: string; ValueData: " folderName"; 
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Shell\copyDetails...\Shell\11.folderName\command"; ValueType: string; ValueData: "{app}\copyDetails.exe -i ""%1"" -m folderName";
			
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Shell\copyDetails...\Shell\12.folderName_Quotes"; ValueType: string; ValueData: """folderName"""; 
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Shell\copyDetails...\Shell\12.folderName_Quotes\command"; ValueType: string; ValueData: "{app}\copyDetails.exe -i ""%1"" -m folderName_Quotes";
		
		Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Background\Shell\copyDetails..."; Flags: uninsdeletekey;
		Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Background\Shell\copyDetails..."; ValueType: string; ValueName: "MUIVerb"; ValueData: "copyDetails...";
		Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Background\Shell\copyDetails..."; ValueType: string; ValueName: "Position"; ValueData: "Middle";
		Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Background\Shell\copyDetails..."; ValueType: string; ValueName: "SeparatorBefore"; ValueData: "";
		Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Background\Shell\copyDetails..."; ValueType: string; ValueName: "SeparatorAfter"; ValueData: "";
		Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Background\Shell\copyDetails..."; ValueType: string; ValueName: "Icon"; ValueData: "{app}\icons\copy.ico";
		Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Background\Shell\copyDetails..."; ValueType: string; ValueName: "SubCommands"; ValueData: "";
		Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Background\Shell\copyDetails...\Shell";
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Background\Shell\copyDetails...\Shell\01.fullPath"; ValueType: string; ValueData: " fullPath"; 
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Background\Shell\copyDetails...\Shell\01.fullPath\command"; ValueType: string; ValueData: "{app}\copyDetails.exe -i ""%1"" -m fullPath";
			
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Background\Shell\copyDetails...\Shell\02.fullPath_Quotes"; ValueType: string; ValueData: """fullPath"""; 
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Background\Shell\copyDetails...\Shell\02.fullPath_Quotes\command"; ValueType: string; ValueData: "{app}\copyDetails.exe -i ""%1"" -m fullPath_Quotes";
			
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Background\Shell\copyDetails...\Shell\03.fullPath_Backslash"; ValueType: string; ValueData: " fullPath\"; 
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Background\Shell\copyDetails...\Shell\03.fullPath_Backslash\command"; ValueType: string; ValueData: "{app}\copyDetails.exe -i ""%1"" -m fullPath_Backslash";
			
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Background\Shell\copyDetails...\Shell\04.fullPath_Backslash_Quotes"; ValueType: string; ValueData: """fullPath\"""; 
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Background\Shell\copyDetails...\Shell\04.fullPath_Backslash_Quotes\command"; ValueType: string; ValueData: "{app}\copyDetails.exe -i ""%1"" -m fullPath_Backslash_Quotes";
			
			; Insert seperator below
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Background\Shell\copyDetails...\Shell\04.fullPath_Backslash_Quotes"; ValueType: dword; ValueName: "CommandFlags"; ValueData: "$00000040";
			
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Background\Shell\copyDetails...\Shell\05.driveLetter"; ValueType: string; ValueData: "driveLetter"; 
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Background\Shell\copyDetails...\Shell\05.driveLetter\command"; ValueType: string; ValueData: "{app}\copyDetails.exe -i ""%1"" -m driveLetter";
			
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Background\Shell\copyDetails...\Shell\06.driveLetter_Colon"; ValueType: string; ValueData: "driveLetter:"; 
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Background\Shell\copyDetails...\Shell\06.driveLetter_Colon\command"; ValueType: string; ValueData: "{app}\copyDetails.exe -i ""%1"" -m driveLetter_Colon";
			
			; Insert seperator below
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Background\Shell\copyDetails...\Shell\06.driveLetter_Colon"; ValueType: dword; ValueName: "CommandFlags"; ValueData: "$00000040";
			
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Background\Shell\copyDetails...\Shell\07.currentPath"; ValueType: string; ValueData: " currentPath"; 
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Background\Shell\copyDetails...\Shell\07.currentPath\command"; ValueType: string; ValueData: "{app}\copyDetails.exe -i ""%1"" -m currentPath";
			
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Background\Shell\copyDetails...\Shell\08.currentPath_Quotes"; ValueType: string; ValueData: """currentPath"""; 
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Background\Shell\copyDetails...\Shell\08.currentPath_Quotes\command"; ValueType: string; ValueData: "{app}\copyDetails.exe -i ""%1"" -m currentPath_Quotes";
			
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Background\Shell\copyDetails...\Shell\09.currentPath_Backslash"; ValueType: string; ValueData: " currentPath\"; 
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Background\Shell\copyDetails...\Shell\09.currentPath_Backslash\command"; ValueType: string; ValueData: "{app}\copyDetails.exe -i ""%1"" -m currentPath_Backslash";
			
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Background\Shell\copyDetails...\Shell\10.currentPath_Backslash_Quotes"; ValueType: string; ValueData: """currentPath\"""; 
			Root: HKA; Subkey: "SOFTWARE\Classes\Directory\Background\Shell\copyDetails...\Shell\10.currentPath_Backslash_Quotes\command"; ValueType: string; ValueData: "{app}\copyDetails.exe -i ""%1"" -m currentPath_Backslash_Quotes";

	; Files
		Root: HKA; Subkey: "SOFTWARE\Classes\*\Shell\copyDetails..."; Flags: uninsdeletekey;
		Root: HKA; Subkey: "SOFTWARE\Classes\*\Shell\copyDetails..."; ValueType: string; ValueName: "MUIVerb"; ValueData: "copyDetails...";
		Root: HKA; Subkey: "SOFTWARE\Classes\*\Shell\copyDetails..."; ValueType: string; ValueName: "Position"; ValueData: "Middle" ;
		Root: HKA; Subkey: "SOFTWARE\Classes\*\Shell\copyDetails..."; ValueType: string; ValueName: "SeparatorBefore"; ValueData: "";
		Root: HKA; Subkey: "SOFTWARE\Classes\*\Shell\copyDetails..."; ValueType: string; ValueName: "SeparatorAfter"; ValueData: "";
		Root: HKA; Subkey: "SOFTWARE\Classes\*\Shell\copyDetails..."; ValueType: string; ValueName: "Icon"; ValueData: "{app}\icons\copy.ico";
		Root: HKA; Subkey: "SOFTWARE\Classes\*\Shell\copyDetails..."; ValueType: string; ValueName: "SubCommands"; ValueData: "";
		Root: HKA; Subkey: "SOFTWARE\Classes\*\Shell\copyDetails...\Shell";
			Root: HKA; Subkey: "SOFTWARE\Classes\*\Shell\copyDetails...\Shell\01.fullPath"; ValueType: string; ValueData: " fullPath"; 
			Root: HKA; Subkey: "SOFTWARE\Classes\*\Shell\copyDetails...\Shell\01.fullPath\command"; ValueType: string; ValueData: "{app}\copyDetails.exe -i ""%1"" -m fullPath";
			
			Root: HKA; Subkey: "SOFTWARE\Classes\*\Shell\copyDetails...\Shell\02.fullPath_Quotes"; ValueType: string; ValueData: """fullPath"""; 
			Root: HKA; Subkey: "SOFTWARE\Classes\*\Shell\copyDetails...\Shell\02.fullPath_Quotes\command"; ValueType: string; ValueData: "{app}\copyDetails.exe -i ""%1"" -m fullPath_Quotes";
			
			; Insert seperator below
			Root: HKA; Subkey: "SOFTWARE\Classes\*\Shell\copyDetails...\Shell\02.fullPath_Quotes"; ValueType: dword; ValueName: "CommandFlags"; ValueData: "$00000040";
			
			Root: HKA; Subkey: "SOFTWARE\Classes\*\Shell\copyDetails...\Shell\03.driveLetter"; ValueType: string; ValueData: "driveLetter"; 
			Root: HKA; Subkey: "SOFTWARE\Classes\*\Shell\copyDetails...\Shell\03.driveLetter\command"; ValueType: string; ValueData: "{app}\copyDetails.exe -i ""%1"" -m driveLetter";
			
			Root: HKA; Subkey: "SOFTWARE\Classes\*\Shell\copyDetails...\Shell\04.driveLetter_Colon"; ValueType: string; ValueData: "driveLetter:"; 
			Root: HKA; Subkey: "SOFTWARE\Classes\*\Shell\copyDetails...\Shell\04.driveLetter_Colon\command"; ValueType: string; ValueData: "{app}\copyDetails.exe -i ""%1"" -m driveLetter_Colon";
			
			; Insert seperator below
			Root: HKA; Subkey: "SOFTWARE\Classes\*\Shell\copyDetails...\Shell\04.driveLetter_Colon"; ValueType: dword; ValueName: "CommandFlags"; ValueData: "$00000040";
			
			Root: HKA; Subkey: "SOFTWARE\Classes\*\Shell\copyDetails...\Shell\05.currentPath"; ValueType: string; ValueData: " currentPath"; 
			Root: HKA; Subkey: "SOFTWARE\Classes\*\Shell\copyDetails...\Shell\05.currentPath\command"; ValueType: string; ValueData: "{app}\copyDetails.exe -i ""%1"" -m currentPath";
			
			Root: HKA; Subkey: "SOFTWARE\Classes\*\Shell\copyDetails...\Shell\06.currentPath_Quotes"; ValueType: string; ValueData: """currentPath"""; 
			Root: HKA; Subkey: "SOFTWARE\Classes\*\Shell\copyDetails...\Shell\06.currentPath_Quotes\command"; ValueType: string; ValueData: "{app}\copyDetails.exe -i ""%1"" -m currentPath_Quotes";
			
			Root: HKA; Subkey: "SOFTWARE\Classes\*\Shell\copyDetails...\Shell\07.currentPath_Backslash"; ValueType: string; ValueData: " currentPath\"; 
			Root: HKA; Subkey: "SOFTWARE\Classes\*\Shell\copyDetails...\Shell\07.currentPath_Backslash\command"; ValueType: string; ValueData: "{app}\copyDetails.exe -i ""%1"" -m currentPath_Backslash";
			
			Root: HKA; Subkey: "SOFTWARE\Classes\*\Shell\copyDetails...\Shell\08.currentPath_Backslash_Quotes"; ValueType: string; ValueData: """currentPath\"""; 
			Root: HKA; Subkey: "SOFTWARE\Classes\*\Shell\copyDetails...\Shell\08.currentPath_Backslash_Quotes\command"; ValueType: string; ValueData: "{app}\copyDetails.exe -i ""%1"" -m currentPath_Backslash_Quotes";
			
			; Insert seperator below
			Root: HKA; Subkey: "SOFTWARE\Classes\*\Shell\copyDetails...\Shell\08.currentPath_Backslash_Quotes"; ValueType: dword; ValueName: "CommandFlags"; ValueData: "$00000040";
			
			Root: HKA; Subkey: "SOFTWARE\Classes\*\Shell\copyDetails...\Shell\09.fileName"; ValueType: string; ValueData: " fileName"; 
			Root: HKA; Subkey: "SOFTWARE\Classes\*\Shell\copyDetails...\Shell\09.fileName\command"; ValueType: string; ValueData: "{app}\copyDetails.exe -i ""%1"" -m fileName";
			
			Root: HKA; Subkey: "SOFTWARE\Classes\*\Shell\copyDetails...\Shell\10.fileName_Quotes"; ValueType: string; ValueData: """fileName"""; 
			Root: HKA; Subkey: "SOFTWARE\Classes\*\Shell\copyDetails...\Shell\10.fileName_Quotes\command"; ValueType: string; ValueData: "{app}\copyDetails.exe -i ""%1"" -m fileName_Quotes";
			
			Root: HKA; Subkey: "SOFTWARE\Classes\*\Shell\copyDetails...\Shell\11.fileName_Ext"; ValueType: string; ValueData: " fileName.Ext"; 
			Root: HKA; Subkey: "SOFTWARE\Classes\*\Shell\copyDetails...\Shell\11.fileName_Ext\command"; ValueType: string; ValueData: "{app}\copyDetails.exe -i ""%1"" -m fileName_Ext";
			
			Root: HKA; Subkey: "SOFTWARE\Classes\*\Shell\copyDetails...\Shell\12.fileName_Ext_Quotes"; ValueType: string; ValueData: """fileName.Ext"""; 
			Root: HKA; Subkey: "SOFTWARE\Classes\*\Shell\copyDetails...\Shell\12.fileName_Ext_Quotes\command"; ValueType: string; ValueData: "{app}\copyDetails.exe -i ""%1"" -m fileName_Ext_Quotes";
			
			Root: HKA; Subkey: "SOFTWARE\Classes\*\Shell\copyDetails...\Shell\13.Ext"; ValueType: string; ValueData: " Ext"; 
			Root: HKA; Subkey: "SOFTWARE\Classes\*\Shell\copyDetails...\Shell\13.Ext\command"; ValueType: string; ValueData: "{app}\copyDetails.exe -i ""%1"" -m Ext";