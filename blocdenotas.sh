pwd
cd ~/dropbox/1f.ἡἔρις,κ/1.ontology 
jb build bloc
cp -r bloc/* denotas
cd denotas
git add ./*
git commit -m "what exactly is the cost of a superlong commit message? lets find out: .. ok. its complicated. anyway, this is a test commit. "
chmod 600 ~/.ssh/id_blocdenotas
git remote -v
ssh-add -D
git remote set-url origin git@github.com:muzaale/denotas 
ssh-add ~/.ssh/id_blocdenotas
bloc 
git push 
ghp-import -n -p -f _build/html