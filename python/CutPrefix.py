########################################################
# Cut prefix name of files on the specific directory.
#
# Note:
#     If some file names are duplicated,
#     just add '_DUPLICATED' tag to the end of the file.
#
# sMiLo / 2013.03.12
########################################################

import glob, os

# TARGET_DIRECTORY
TARGET_DIR = 'TARGET_DIRECTORY_HERE'

# THE PREFIX NUMBERS TO CUT
CUTTING_PREFIX_COUNT = 5

if __name__ == '__main__':

    filelist = glob.glob(TARGET_DIR + '*')

    for f in filelist:
        cuttingCount = CUTTING_PREFIX_COUNT + len(TARGET_DIR);
        cuttedFileName = TARGET_DIR + f[cuttingCount:]
        if os.path.exists(cuttedFileName):
            print 'Duplicated file name :' + cuttedFileName
            cuttedFileName = cuttedFileName + '_DUPLICATED'
        os.rename(f, cuttedFileName);
        print(f + " -> " + cuttedFileName);
