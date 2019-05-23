This is the official CI Repo for ILIAS.

## Create encrypted key with github for Travis.
* Login to github with the ci account
* Go to Settings => Developer settings => Personal access tokens
* Create a new token
* Ensure it has the code "public_repo"
* Install the travis gem on your computer
* Use the following command line to encrypt your personal access token (xyz)
  * travis encrypt --com -r ILIAS-eLearning/ILIAS ILIAS_VAR=xyz --add
  * Use "--add" to add your token automatically to the .travis.yml 