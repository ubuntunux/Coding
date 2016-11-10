import os, glob, collections

ignores = (".git", "__pycache__", ".ropeproject","src")

languages = collections.OrderedDict({
    "C" : "*.c",
    "C++" : "*.cpp",
    "Go" : "*.go",
    "Haskell" : "*.hs",
    "Julia" : "*.jl",
    "Python" : "*.py",
    })


totalResolve = collections.OrderedDict()
    
for lang in languages:
    totalResolve[lang] = 0

index = 1
for folder in os.listdir():
    if os.path.isdir(folder) and folder not in ignores:
        print(index, folder)
        index += 1
        for lang in languages:
            files = list(glob.glob(os.path.join(folder, languages[lang])))
            numFiles = len(files)
            filenames = ", ".join([os.path.split(filename)[1] for filename in files])            
            print("\t%s(%d) : %s" % (lang, numFiles, filenames))
            totalResolve[lang] += numFiles
        print("")
        
print("="*40)
print("Total resolved info")
print("="*40)
        
for lang in languages:
    print("\t%s : %d solved" % (lang, totalResolve[lang]))
