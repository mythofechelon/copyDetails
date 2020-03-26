import sys, getopt, pefile, pyperclip

# Get full command-line arguments
cli_arguments = sys.argv

# Keep all but the first (the script)
argument_list = cli_arguments[1:]

short_options = "hi:m:"
long_options = ["help", "input=", "mode="]

try:
    arguments, values = getopt.getopt(argument_list, short_options, long_options)
except getopt.error as err:
    # Output error, and return with an error code
    print(str(err))
    sys.exit(2)

# Evaluate given options
for current_argument, current_value in arguments:
    if current_argument in ("-h", "--help"):
        print('''
Usage: copyDetails -i path -m mode

Arguments:
    -i, --input     Path to file or folder
    -m, --mode      Modes:
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
                    
                    fileVersion
        ''')
    elif current_argument in ("-i", "--input"):
        path_Original = current_value
    elif current_argument in ("-m", "--mode"):
        mode = current_value


if mode == "fullPath":
    toCopy = path_Original
    
elif mode == "fullPath_Quotes":
    toCopy = '"' + path_Original + '"'
    
elif mode == "fullPath_Backslash":
    toCopy = path_Original + '\\'
    
elif mode == "fullPath_Backslash_Quotes":
    toCopy = '"' + path_Original + '\\"'
    
elif mode == "driveLetter":
    toCopy = path_Original.rsplit(":",1)[0]
    
elif mode == "driveLetter_Colon":
    toCopy = path_Original.rsplit(":",1)[0] + ":"
    
elif mode == "currentPath":
    toCopy = path_Original.rsplit("\\",1)[0]
    
elif mode == "currentPath_Quotes":
    toCopy = '"' + path_Original.rsplit("\\",1)[0] + '"'
    
elif mode == "currentPath_Backslash":
    toCopy = path_Original.rsplit("\\",1)[0] + "\\"
    
elif mode == "currentPath_Backslash_Quotes":
    toCopy = '"' + path_Original.rsplit("\\",1)[0] + '\\"'
    
elif mode == "folderName":
    toCopy = path_Original.rsplit("\\",1)[1]
    
elif mode == "folderName_Quotes":
    toCopy = '"' + path_Original.rsplit("\\",1)[1] + '"'
    
elif mode == "fileName":
    toCopy = path_Original.rsplit("\\",1)[1].rsplit(".",1)[0]
    
elif mode == "fileName_Quotes":
    toCopy = '"' + path_Original.rsplit("\\",1)[1].rsplit(".",1)[0] + '"'
    
elif mode == "fileName_Ext":
    toCopy = path_Original.rsplit("\\",1)[1]
    
elif mode == "fileName_Ext_Quotes":
    toCopy = '"' + path_Original.rsplit("\\",1)[1] + '"'
    
elif mode == "Ext":
    toCopy = path_Original.rsplit("\\",1)[1].rsplit(".",1)[1]
    
elif mode == "fileVersion":
    return
    
# print(toCopy)
pyperclip.copy(toCopy)