import sys, getopt, tempfile, os, time, pyperclip

cli_arguments = sys.argv
argument_list = cli_arguments[1:] # "1:" means keep all but the first argument, which is the script itself

short_options = "hi:m:"
long_options = ["help", "input=", "mode="]

try:
	arguments, values = getopt.getopt(argument_list, short_options, long_options)
except getopt.error as error:
	print(str(error))
	sys.exit()

for current_argument, current_value in arguments:
	if current_argument in ("-h", "--help"):
		print('''
Usage: copyDetails -i path -m mode

Arguments:
	-i, --input	 Path to file or folder
	-m, --mode	  Modes:
					fullPath
					fullPath_Quotes
					fullPath_Backslash
					fullPath_Backslash_Quotes
					
					driveLetter
					driveLetter_Colon
					
					currentPath
					currentPath_Quotes
					currentPath_Backslash
					currentPath_Backslash_Quotes
					
					folderName
					folderName_Quotes
					
					fileName
					fileName_Quotes
					fileName_Ext
					fileName_Ext_Quotes
					Ext
		''')
	elif current_argument in ("-i", "--input"):
		path_Original = current_value
	elif current_argument in ("-m", "--mode"):
		mode = current_value

if ("path_Original" in locals() and "mode" in locals()):
	tempFile_Directory = tempfile.gettempdir()
	tempFile_Path = tempFile_Directory + "\copyDetails_temp.txt"

	time_tempFile_lastModified_Unix = os.path.getmtime(tempFile_Path)
	time_tempFile_lastModified_Seconds = int(time_tempFile_lastModified_Unix)
	time_Now = time.time()
	time_Difference = time_Now - time_tempFile_lastModified_Seconds
	
	# print(time_Difference)
	
	if time_Difference > 1.5:
		# Been longer than 1.5 seconds so probably not a sequential write, therefore overwrite
		tempFile = open(tempFile_Path, "w") 
	else:
		tempFile = open(tempFile_Path, "a") 
		tempFile.write("\n")
	
	if mode == "fullPath":
		toWrite = path_Original
		
	elif mode == "fullPath_Quotes":
		toWrite = '"' + path_Original + '"'
		
	elif mode == "fullPath_Backslash":
		toWrite = path_Original + '\\'
		
	elif mode == "fullPath_Backslash_Quotes":
		toWrite = '"' + path_Original + '\\"'
		
	elif mode == "driveLetter":
		toWrite = path_Original.rsplit(":",1)[0]
		
	elif mode == "driveLetter_Colon":
		toWrite = path_Original.rsplit(":",1)[0] + ":"
		
	elif mode == "currentPath":
		toWrite = path_Original.rsplit("\\",1)[0]
		
	elif mode == "currentPath_Quotes":
		toWrite = '"' + path_Original.rsplit("\\",1)[0] + '"'
		
	elif mode == "currentPath_Backslash":
		toWrite = path_Original.rsplit("\\",1)[0] + "\\"
		
	elif mode == "currentPath_Backslash_Quotes":
		toWrite = '"' + path_Original.rsplit("\\",1)[0] + '\\"'
		
	elif mode == "folderName":
		toWrite = path_Original.rsplit("\\",1)[1]
		
	elif mode == "folderName_Quotes":
		toWrite = '"' + path_Original.rsplit("\\",1)[1] + '"'
		
	elif mode == "fileName":
		toWrite = path_Original.rsplit("\\",1)[1].rsplit(".",1)[0]
		
	elif mode == "fileName_Quotes":
		toWrite = '"' + path_Original.rsplit("\\",1)[1].rsplit(".",1)[0] + '"'
		
	elif mode == "fileName_Ext":
		toWrite = path_Original.rsplit("\\",1)[1]
		
	elif mode == "fileName_Ext_Quotes":
		toWrite = '"' + path_Original.rsplit("\\",1)[1] + '"'
		
	elif mode == "Ext":
		toWrite = path_Original.rsplit("\\",1)[1].rsplit(".",1)[1]
		
	else:
		toWrite = ""
		
	tempFile.write(toWrite)
	tempFile.close()

	tempFile = open(tempFile_Path, "r") 
	toCopy = tempFile.read()
	tempFile.close()

	pyperclip.copy(toCopy)
	
	# input() # Stop command window from closing in order to observe output
else:
	print("Parameters not defined correctly. Exiting...")
	sys.exit()