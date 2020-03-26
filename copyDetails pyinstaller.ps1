# 64-bit
& "$Env:localAppData\Programs\Python\Python37\Scripts\pyinstaller.exe" --onefile --windowed --icon="$Env:userProfile\Desktop\copyDetails\Source\icons\copy.ico" --version-file="$Env:userProfile\Desktop\copyDetails\Source\copyDetails.inf" "$Env:userProfile\Desktop\copyDetails\Source\copyDetails.py"

# 32-bit
& "$Env:localAppData\Programs\Python\Python37-32\Scripts\pyinstaller.exe" --onefile --windowed --icon="$Env:userProfile\Desktop\copyDetails\Source\icons\copy.ico" --version-file="$Env:userProfile\Desktop\copyDetails\Source\copyDetails.inf" "$Env:userProfile\Desktop\copyDetails\Source\copyDetails.py"