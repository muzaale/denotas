# Define SUBDIR_NAME
SUBDIR_NAME="bloc"

# Define arrays for acts and the number of files for each act
acts=(
  "${SUBDIR_NAME}_0" "${SUBDIR_NAME}_1" "${SUBDIR_NAME}_2" "${SUBDIR_NAME}_3" 
  "${SUBDIR_NAME}_4" "${SUBDIR_NAME}_5" "${SUBDIR_NAME}_6" "${SUBDIR_NAME}_7"
  "${SUBDIR_NAME}_8" "${SUBDIR_NAME}_9" 
  )
act_files=(0 1 2 3 4 5 6 7 8 9)

# Create Act directories and their corresponding files
for ((i=0; i<${#acts[@]}; i++)); do
  mkdir -p ${acts[$i]}
  for ((j=0; j<=${act_files[$i]}; j++)); do
    cp "bdn.ipynb" "${acts[$i]}/${SUBDIR_NAME}_$(($i + 0))_$j.ipynb"
  done
done

